from django.contrib.auth import get_user_model
from django.db import models

from apps.content.models import Post

User = get_user_model()


# Create your models here.
class Comment(models.Model):
    STATUS_NORMAL = 1
    STATUS_DELETE = 0
    STATUS_ITEMS = (
        (STATUS_DELETE, '删除'),
        (STATUS_NORMAL, '正常')
    )
    target = models.CharField(max_length=100, verbose_name='评论目标')
    status = models.IntegerField(default=STATUS_NORMAL, choices=STATUS_ITEMS, verbose_name='状态')
    content = models.TextField(verbose_name='内容')
    owner = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='评论人')
    created_time = models.DateTimeField(auto_now_add=True, verbose_name='评论时间')

    class Meta:
        verbose_name = verbose_name_plural = '评论'

    def __str__(self):
        return self.target

    @classmethod
    def latest_comment(cls):
        return cls.objects.filter(status=cls.STATUS_NORMAL).order_by('-created_time')[:4]

    @classmethod
    def get_by_target(cls, target):
        return cls.objects.filter(status=cls.STATUS_NORMAL).filter(target=target)
