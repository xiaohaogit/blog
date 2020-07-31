# -*- coding: utf-8 -*-
# @Author  : xiaohao
# @Email   : 321459055@qq.com
# @File    : adminx.py
# @Software: PyCharm
# @Time    : 2020/7/28 21:08
import xadmin
from apps.config.models import SideBar, Link, DisplayType
from myblog.base_admin import BaseOwnerAdmin
from xadmin.layout import Fieldset, Row, Container


# class SideBarInline:
#     form_layout = (
#         Container(
#             Row("status"),
#             Row("owner"),
#         )
#     )
#     model = SideBar
#     extra = 1
#     can_delete = False
#     show_change_link = True


class SideBarAdmin(BaseOwnerAdmin):
    list_display = ('status', 'display_type', 'created_time')

    def save_models(self):
        self.new_obj.owner = self.request.user
        return super().save_models()


xadmin.site.register(SideBar, SideBarAdmin)


class DisplayTypeAdmin(BaseOwnerAdmin):
    # inlines = (SideBarInline,)
    list_display = ('type', 'owner', 'created_time')
    fields = ('type',)


xadmin.site.register(DisplayType, DisplayTypeAdmin)


class LinkAdmin(BaseOwnerAdmin):

    def save_models(self):
        self.new_obj.owner = self.request.user
        return super().save_models()


xadmin.site.register(Link, LinkAdmin)
