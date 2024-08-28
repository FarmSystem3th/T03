from django.db import models
from django.contrib.auth.models import Group, Permission, AbstractBaseUser, BaseUserManager, PermissionsMixin
from phonenumber_field.modelfields import PhoneNumberField

class CustomUserManager(BaseUserManager):
    def create_user(self, username, password=None, **extra_fields):
        user = self.model(username=username,  **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, username,  password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        return self.create_user(username, password, **extra_fields)

class CustomUser(AbstractBaseUser, PermissionsMixin):
    username = models.CharField(max_length=20, unique=True)
    password = models.CharField(max_length=128)
    name = models.CharField(max_length=50)
    birthdate = models.DateField(null=True, blank=True)
    phone_number = PhoneNumberField(unique=True, null=False, blank=False)
    address = models.CharField(max_length=100)
    level = models.IntegerField(default=0)
    rebon = models.IntegerField(default=0)
    icon = models.IntegerField(default=0)

    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)

    objects = CustomUserManager()

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['password', 'name', 'birthdate', 'phone_number', 'address']

    groups = models.ManyToManyField(
        Group,
        related_name='customuser_set',  # 충돌 방지를 위한 고유한 이름
        blank=True,
    )
    user_permissions = models.ManyToManyField(
        Permission,
        related_name='customuser_set',  # 충돌 방지를 위한 고유한 이름
        blank=True,
    )

    def __str__(self):
        return self.username
