# -*- coding: utf-8 -*-
# @Author  : xiaohao
# @Email   : 321459055@qq.com
# @File    : adminx.py
# @Software: PyCharm
# @Time    : 2020/7/28 14:19
from myblog.base_admin import BaseOwnerAdmin
from .models import Comment
import xadmin


class CommentAdmin(BaseOwnerAdmin):
    list_display = ('target', 'status', 'owner')


xadmin.site.register(Comment, CommentAdmin)
