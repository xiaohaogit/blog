from django.contrib.auth import get_user_model
from django.db import models
from DjangoUeditor.models import UEditorField

User = get_user_model()


# Create your models here.
class Category(models.Model):
    STATUS_NORMAL = 1
    STATUS_DELETE = 0
    STATUS_ITEMS = (
        (STATUS_DELETE, '删除'),
        (STATUS_NORMAL, '正常')
    )
    status = models.PositiveIntegerField(default=STATUS_NORMAL, choices=STATUS_ITEMS, verbose_name='状态')
    name = models.CharField(max_length=20, verbose_name='类别')
    is_nav = models.BooleanField(default=False, verbose_name='是否为导航栏')
    owner = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='作者')
    created_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')

    class Meta:
        verbose_name = verbose_name_plural = '分类'

    def __str__(self):
        return self.name

    @classmethod
    def get_all(cls):
        return cls.objects.filter(status=cls.STATUS_NORMAL)

    @classmethod
    def get_navs(cls):
        return cls.objects.filter(is_nav=True)


class Tag(models.Model):
    STATUS_NORMAL = 1
    STATUS_DELETE = 0
    STATUS_ITEMS = (
        (STATUS_DELETE, '删除'),
        (STATUS_NORMAL, '正常')
    )
    name = models.CharField(max_length=20, verbose_name='名称')
    status = models.IntegerField(default=STATUS_NORMAL, choices=STATUS_ITEMS, verbose_name='状态')
    owner = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='作者')
    created_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')

    class Meta:
        verbose_name = verbose_name_plural = '标签'

    def __str__(self):
        return self.name

    @classmethod
    def get_all(cls):
        return cls.objects.filter(status=cls.STATUS_NORMAL)


class Post(models.Model):
    STATUS_NORMAL = 1
    STATUS_DELETE = 0
    STATUS_DRAFT = 2
    STATUS_ITEMS = {
        (STATUS_NORMAL, '正常'),
        (STATUS_DELETE, '删除'),
        (STATUS_DRAFT, '草稿'),
    }
    status = models.PositiveIntegerField(choices=STATUS_ITEMS, default=STATUS_NORMAL, verbose_name="状态")
    title = models.CharField(max_length=128, verbose_name='标题')
    desc = models.CharField(max_length=128, verbose_name='摘要')
    # content = models.TextField(verbose_name="正文", help_text='正文必须是Markdown格式')
    category = models.ForeignKey(Category, on_delete=models.DO_NOTHING, verbose_name="分类")
    tags = models.ManyToManyField(Tag, verbose_name='标签')
    owner = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='作者')
    created_time = models.DateTimeField(auto_now=True, verbose_name='创建时间')

    content = UEditorField(width=800, toolbars="full", imagePath="uploadimg/", filePath="upload",
                           upload_settings={"imageMaxSize": 2408000}, blank=True)

    pv = models.PositiveIntegerField(default=1, verbose_name='点击数')  # 点击数
    uv = models.PositiveIntegerField(default=1, verbose_name='用户访问数')  # 用户访问数

    class Meta:
        verbose_name = verbose_name_plural = '文章'
        ordering = ['-created_time']

    def __str__(self):
        return self.title

    @classmethod
    def get_all(cls):
        return Post.objects.filter(status=cls.STATUS_NORMAL)

    def get_tags(self):
        tags = self.tags.all()
        return tags

    @classmethod
    def latest_posts(cls):
        posts = cls.objects.filter(status=cls.STATUS_NORMAL).order_by('created_time')
        return posts

    @classmethod
    def hot_posts(cls):
        posts = cls.objects.filter(status=cls.STATUS_NORMAL).order_by('pv')
        return posts

