# -*- coding: utf-8 -*-
# @Author  : xiaohao
# @Email   : 321459055@qq.com
# @File    : comment_block.py
# @Software: PyCharm
# @Time    : 2020/7/31 17:08


from django import template

from apps.comment.form import CommentForm
from apps.comment.models import Comment

register = template.Library()


@register.inclusion_tag('block.html')
def comment_block(target):
    """Removes all values of arg from the given string"""
    return {
        'target': target,
        'comment_form': CommentForm(),
        'comment_list': Comment.get_by_target(target)
    }
