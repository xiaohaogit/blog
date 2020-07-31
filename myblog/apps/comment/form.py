# -*- coding: utf-8 -*-
# @Author  : xiaohao
# @Email   : 321459055@qq.com
# @File    : form.py
# @Software: PyCharm
# @Time    : 2020/7/31 17:28
from django import forms

from apps.comment.models import Comment


class CommentForm(forms.ModelForm):

    nickname = forms.CharField(max_length=20, label='昵称',
                               widget=forms.TextInput(attrs={'class': 'form-control', 'style': 'width:30%;'}))
    content = forms.CharField(label='内容', widget=forms.Textarea(attrs={'class': 'form-control'}))

    class Meta:
        model = Comment
        fields = ('content',)
