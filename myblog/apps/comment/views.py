from django.shortcuts import render, redirect

# Create your views here.
from django.views.generic import TemplateView

from apps.comment.form import CommentForm


class CommentView(TemplateView):
    template_name = 'comment_result.html'
    # http_method_names = ['post', ]

    def post(self, request):
        comment_form = CommentForm(request.POST)
        target = request.POST.get('target')
        if comment_form.is_valid():
            instance = comment_form.save(commit=False)
            instance.target = target
            instance.owner_id = request.user.id
            instance.save()
            succeed = True
            return redirect(target)
        else:
            succeed = False

        context = {
            'succeed': succeed,
            'comment_form': comment_form,
            'target': target
        }

        return self.render_to_response(context)
