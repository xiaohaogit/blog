from django.contrib import admin

# Register your models here.
from apps.config.models import Link, SideBar


class LinkAdmin(admin.ModelAdmin):
    pass

    class Meta:
        verbose_name = '友链'


admin.site.register(Link, LinkAdmin)


class SideBarAdmin(admin.ModelAdmin):
    pass

    class Meta:
        verbose_name = '侧边栏'


admin.site.register(SideBar, SideBarAdmin)
