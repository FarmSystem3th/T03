from django.db import models
from users.models import CustomUser

class StepCount(models.Model):
    custom_user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    date = models.DateField()
    step = models.PositiveIntegerField(default=0)