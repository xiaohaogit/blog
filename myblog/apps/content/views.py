from datetime import date

from django.core.cache import cache
from django.db.models import Q, F

# Create your views here.
from django.views.generic import ListView, DetailView

from apps.comment.models import Comment
from apps.config.models import SideBar
from apps.content.models import Post, Category, Tag


class CommentViewMixin:
    def get_context_data(self, **kwargs):
        context = super(CommentViewMixin, self).get_context_data(**kwargs)
        context.update({
            "sidebars": SideBar.get_all()
        })
        context.update({
            "navs": Category.get_navs()[:2]
            # 只让导航栏显示两个分类
        })
        context.update({
            'tags': Tag.objects.filter(status=Tag.STATUS_NORMAL)
        })
        context.update({
            'categories': Category.get_all()
        })
        context.update({
            'latest_posts': Post.latest_posts()
        })
        context.update({
            'hot_posts': Post.hot_posts()
        })
        context.update({
            'latest_comment': Comment.latest_comment()
        })

        return context


class IndexView(CommentViewMixin, ListView):
    queryset = Post.objects.filter(status=Post.STATUS_NORMAL).select_related('owner', 'category')
    template_name = 'list.html'
    context_object_name = 'post_list'  # 默认为object_list  其中object为模型对象，这里是post，即默认为post_list
    paginate_by = 4


class PostDetailView(CommentViewMixin, DetailView):
    queryset = Post.objects.filter(status=Post.STATUS_NORMAL).select_related('owner', 'category')
    template_name = 'detail.html'
    pk_url_kwarg = 'post_id'
    context_object_name = 'post_item'

    def get(self, request, *args, **kwargs):
        response = super(PostDetailView, self).get(request, *args, **kwargs)
        self.handle_visited()
        return response

    def handle_visited(self):
        increase_pv = False
        increase_uv = False
        # uid = self.request.uid
        uid = self.request.COOKIES['uid']
        pv_key = "pv:%s:%s" % (uid, self.request.path)
        if not cache.get(pv_key):
            increase_pv = True
            cache.set(pv_key, 1, 1 * 60)

        uv_key = "uv:%s:%s:%s" % (uid, str(date.today()), self.request.path)
        if not cache.get(uv_key):
            increase_uv = True
            cache.set(uv_key, 1, 24 * 60 * 60)

        if increase_pv and increase_uv:
            Post.objects.filter(pk=self.object.id).update(pv=F('pv') + 1, uv=F('uv') + 1)
        elif increase_pv:
            Post.objects.filter(pk=self.object.id).update(pv=F('pv') + 1)
        elif increase_uv:
            Post.objects.filter(pk=self.object.id).update(uv=F('uv') + 1)


class TagView(IndexView):
    def get_queryset(self):
        queryset = super(TagView, self).get_queryset()
        tag_id = self.kwargs.get('tag_id')
        return queryset.filter(tags__id=tag_id)

    def get_context_data(self, **kwargs):
        context = super(TagView, self).get_context_data(**kwargs)
        tag_id = self.kwargs.get('tag_id')
        tag = Tag.objects.get(id=tag_id)
        context.update({
            "tag": tag
        })
        return context


class CategoryView(IndexView):
    def get_queryset(self):
        queryset = super(CategoryView, self).get_queryset()
        category_id = self.kwargs.get('category_id')
        return queryset.filter(category_id=category_id)

    def get_context_data(self, **kwargs):
        context = super(CategoryView, self).get_context_data(**kwargs)
        category_id = self.kwargs.get('category_id')
        category = Category.objects.get(id=category_id)
        context.update({
            "category": category
        })
        return context


class SearchView(IndexView):
    def get_queryset(self):
        queryset = super(SearchView, self).get_queryset()
        keyword = self.request.GET.get('keyword', '')
        if keyword == '':
            return queryset
        return queryset.filter(Q(content__icontains=keyword) | Q(title__icontains=keyword))
