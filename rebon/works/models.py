from django.db import models
from users.models import CustomUser

# Create your models here.
class MyWork(models.Model):
    work_name = models.CharField(max_length=100, blank=True, null=True)
    start_date = models.DateField()
    end_date = models.DateField()
    status = models.IntegerField(default=0)
    custom_user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)