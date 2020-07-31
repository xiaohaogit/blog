# -*- coding: utf-8 -*-
# @Author  : xiaohao
# @Email   : 321459055@qq.com
# @File    : autocomplete.py
# @Software: PyCharm
# @Time    : 2020/7/30 15:56
from dal import autocomplete

from apps.content.models import Category, Tag


class CategoryAutocomplete(autocomplete.Select2QuerySetView):
    def get_queryset(self):
        # Don't forget to filter out results depending on the visitor !
        if not self.request.user.is_authenticated:
            return Category.objects.none()

        qs = Category.objects.all()
        if self.q:
            qs = qs.filter(name__istartswith=self.q)

        return qs


class TagAutocomplete(autocomplete.Select2QuerySetView):
    def get_queryset(self):
        # Don't forget to filter out results depending on the visitor !
        if not self.request.user.is_authenticated:
            return Tag.objects.none()

        qs = Tag.objects.all()
        if self.q:
            qs = qs.filter(name__istartswith=self.q)

        return qs
