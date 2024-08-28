from django.shortcuts import render
# from django.contrib.auth.models import User
# from django.shortcuts import redirect

from rest_framework import generics, status, permissions
from rest_framework.response import Response

from .serializers import SignupSerializer, LoginSerializer, ProfileSerializer
from django.contrib.auth import get_user_model

CustomUser = get_user_model()

class SignupView(generics.CreateAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = SignupSerializer

class LoginView(generics.GenericAPIView):
    serializer_class = LoginSerializer

    def post(self, request):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        validated_data = serializer.validated_data
        token = validated_data['token']  # 토큰
        user_id = validated_data['user_id']  # 사용자 ID
        
        return Response({
            "token": token,  # 토큰
            "user_id": user_id    # 사용자 ID
        }, status=status.HTTP_200_OK)

class ProfileView(generics.RetrieveUpdateAPIView):
    serializer_class = ProfileSerializer
    queryset = CustomUser.objects.all()
    
    def get_permissions(self):
        if self.request.method == 'GET':
            return [permissions.IsAuthenticated()]  # 조회는 인증된 사용자만 가능
        return [permissions.IsAuthenticated()]  # 수정은 인증된 사용자만 가능

    def get_object(self):
        # 현재 로그인한 사용자 정보 반환
        user_id = self.kwargs['id']
        # 현재 사용자가 요청한 ID와 로그인한 사용자의 ID가 일치하는지 확인
        if str(self.request.user.id) != str(user_id):
            raise serializers.ValidationError("You can only view your own profile.")
        return User.objects.get(id=user_id)
    
    def perform_update(self, serializer):
        # 수정 시 현재 사용자만 수정할 수 있도록 함
        if serializer.validated_data['user'] != self.request.user:
            raise serializers.ValidationError("You can only update your own profile.")
        serializer.save()