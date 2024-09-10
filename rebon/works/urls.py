from django.urls import path
from .views import WorkListView

urlpatterns = [
    path('', WorkListView.as_view()),
]