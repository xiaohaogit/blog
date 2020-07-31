"""myblog URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.urls import include
from django.views.generic import RedirectView

import xadmin
from apps.comment.views import CommentView
from apps.content.views import IndexView, PostDetailView, TagView, CategoryView, SearchView
from myblog.autocomplete import CategoryAutocomplete, TagAutocomplete

urlpatterns = [
    # path('admin/', admin.site.urls),
    url(r'^favicon.ico$', RedirectView.as_view(url=r'static/favicon.ico')),
    url(r'xadmin/', xadmin.site.urls),
    url(r'^ueditor/', include('DjangoUeditor.urls')),
    url(r'^$', IndexView.as_view(), name='index'),
    url(r'^post/(?P<post_id>\d+).html$', PostDetailView.as_view(), name='post-detail'),
    url(r'^tag/(?P<tag_id>\d+)$', TagView.as_view(), name='tag-list'),
    url(r'^category/(?P<category_id>\d+)$', CategoryView.as_view(), name='category-list'),
    url(r'^search$', SearchView.as_view(), name='search-list'),
    url(r'^category-autocomplete/$', CategoryAutocomplete.as_view(), name='category-autocomplete'),
    url(r'^tag-autocomplete/$', TagAutocomplete.as_view(), name='tag-autocomplete'),
    url(r'^comment/$', CommentView.as_view(), name='comment'),
]
