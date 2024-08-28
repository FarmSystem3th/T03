from django.urls import path
from .views import SignupView, LoginView, ProfileView

urlpatterns = [
    path('signup/', SignupView.as_view()),
    path('login/', LoginView.as_view()),
    path('profile/<int:id>/', ProfileView.as_view()),
]