from django.urls import path
from .views import StepCountView

urlpatterns = [
    path('', StepCountView.as_view()),
]