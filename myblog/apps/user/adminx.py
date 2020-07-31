# -*- coding: utf-8 -*-
# @Author  : xiaohao
# @Email   : 321459055@qq.com
# @File    : adminx.py
# @Software: PyCharm
# @Time    : 2020/7/28 15:40
from django.contrib.auth import get_user_model

import xadmin
from apps.user.models import UserProfile
from xadmin import views
from xadmin.layout import Fieldset, Row

User = get_user_model()


class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True  # 调用更多主题


xadmin.site.register(views.BaseAdminView, BaseSetting)


class UserAdmin(object):
    list_display = ('username', 'phone')
    exclude = ('last_login', 'frist_name', 'last_name')
    form_layout = (
        Fieldset(
            '基础信息',
            Row("username", "phone", 'password'),
        ),
        Fieldset(
            '配置信息',
            "is_superuser", "is_staff", "is_active"
        )
    )


xadmin.site.unregister(UserProfile)
xadmin.site.register(User, UserAdmin)
