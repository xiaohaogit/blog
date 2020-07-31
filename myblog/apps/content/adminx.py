# -*- coding: utf-8 -*-
# @Author  : xiaohao
# @Email   : 321459055@qq.com
# @File    : adminx.py
# @Software: PyCharm
# @Time    : 2020/7/28 21:23
import xadmin
from apps.content.adminxform import PostAdminForm
from apps.content.models import Post, Tag, Category
from myblog.base_admin import BaseOwnerAdmin
from xadmin.layout import Fieldset, Row


class PostAdmin(BaseOwnerAdmin):
    # form = PostAdminForm
    # django-autocomplete-light插件使用时 xadmin页面加载速度明显提高  可字段无法编辑 无法自动补全  故弃用
    # 查看PyPI网站知 django-autocomplete-light存在版本问题   似乎只支持python3.4  python2.7
    list_display = ('status', 'title', 'desc', 'tags', 'category', 'content',)
    style_fields = {"content": "ueditor"}

    exclude = ('created_time', 'owner')
    form_layout = (
        Fieldset(
            '主要信息',
            Row("title", "desc", "status"),
            "content",
        ),
        Fieldset(
            '配置信息',
            Row("category", "tags"),
            Row("pv", "uv"),
        )
    )


xadmin.site.register(Post, PostAdmin)


class TagAdmin(BaseOwnerAdmin):
    exclude = ('created_time', 'owner')

    form_layout = (
        Fieldset(
            'Tag',
            Row('status', 'name')
        )
    )


xadmin.site.register(Tag, TagAdmin)


class CategoryAdmin(BaseOwnerAdmin):
    exclude = ('created_time', 'owner')


xadmin.site.register(Category, CategoryAdmin)
