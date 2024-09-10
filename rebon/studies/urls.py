from django.urls import path
from .views import StudyListView

urlpatterns = [
    path('', StudyListView.as_view()),
]