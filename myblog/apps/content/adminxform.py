# -*- coding: utf-8 -*-
# @Author  : xiaohao
# @Email   : 321459055@qq.com
# @File    : adminxform.py
# @Software: PyCharm
# @Time    : 2020/7/30 15:43
from dal import autocomplete
from django import forms

from apps.content.models import Category, Tag, Post


class PostAdminForm(forms.ModelForm):
    category = forms.ModelChoiceField(
        queryset=Category.objects.all(),
        widget=autocomplete.ModelSelect2(url='category-autocomplete'),
        label='分类',
    )
    tags = forms.ModelMultipleChoiceField(
        queryset=Tag.objects.all(),
        widget=autocomplete.ModelSelect2Multiple(url='tag-autocomplete'),
        label='标签',
    )

    class Meta:
        model = Post
        fields = ('category', 'tags', 'status', 'title', 'desc', 'content')
