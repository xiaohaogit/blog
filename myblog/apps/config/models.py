from django.contrib.auth import get_user_model
from django.db import models

from apps.content.models import Post

User = get_user_model()


# Create your models here.
class Link(models.Model):
    STATUS_NORMAL = 1
    STATUS_DELETE = 0
    STATUS_ITEMS = (
        (STATUS_NORMAL, '正常'),
        (STATUS_DELETE, '删除'),
    )
    status = models.IntegerField(default=STATUS_NORMAL, choices=STATUS_ITEMS, verbose_name='状态')
    name = models.CharField(max_length=128, verbose_name='链接说明')
    href = models.URLField(verbose_name='链接')
    weight = models.IntegerField(default=1, choices=zip(range(1, 6), range(1, 6)), verbose_name='权重',
                                 help_text='权重高展示在前')
    owner = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='作者')
    created_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')

    class Meta:
        verbose_name = verbose_name_plural = '友链'

    def __str__(self):
        return self.name


class DisplayType(models.Model):
    type = models.CharField(max_length=15, verbose_name='类型名称')
    owner = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='作者')
    created_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')

    class Meta:
        verbose_name = verbose_name_plural = '侧边栏类型'

    def __str__(self):
        return self.type


class SideBar(models.Model):
    STATUS_SHOW = 1
    STATUS_HIDE = 0
    STATUS_ITEMS = (
        (STATUS_SHOW, '展示'),
        (STATUS_HIDE, '隐藏')
    )
    # SIDE_TYPE = (
    #     (1, '最新文章'),
    #     (2, '最火文章'),
    #     (3, '最近评论'),
    #     (4, '公告'),
    # )
    status = models.IntegerField(default=STATUS_SHOW, choices=STATUS_ITEMS, verbose_name='状态')
    # display_type = models.PositiveIntegerField(default=1, choices=SIDE_TYPE, verbose_name='展示类型')
    # content = models.TextField(verbose_name='内容')
    # title = models.ForeignKey(Post, on_delete=models.DO_NOTHING, verbose_name='标题')
    display_type = models.ForeignKey(DisplayType, on_delete=models.CASCADE, verbose_name='展示类型')
    owner = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='作者')
    created_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')

    class Meta:
        verbose_name = verbose_name_plural = '侧边栏'

    def __str__(self):
        return self.display_type.type

    @staticmethod
    def get_all():
        return SideBar.objects.all()

    def get_new_comment(self):
        return self.objects.filter(display_type=1)
