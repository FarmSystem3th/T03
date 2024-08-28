from django.contrib.auth.password_validation import validate_password # Django의 기본 pw 검증 도구
from django.contrib.auth import authenticate
from django.contrib.auth import get_user_model

from rest_framework import serializers
from rest_framework.authtoken.models import Token # Token 모델
from phonenumbers import parse, format_number, PhoneNumberFormat, is_valid_number

CustomUser = get_user_model()

# 회원가입 시리얼라이저
class SignupSerializer(serializers.ModelSerializer):
    password = serializers.CharField(
        write_only=True,
        required=True,
        validators=[validate_password], # 비밀번호에 대한 검증
    )
    password2 = serializers.CharField( # 비밀번호 확인을 위한 필드
        write_only=True,
        required=True,
    )
    name = serializers.CharField(
        required=True
    )
    birthdate = serializers.DateField(
        required=True
    )
    phone_number = serializers.CharField(
        required=True
    )
    address = serializers.CharField(
        required=True
    )

    class Meta:
        model = CustomUser
        fields = ('username', 'password', 'password2', 'name', 'birthdate', 'phone_number', 'address')

    def validate(self, data): # password과 password2의 일치 여부 확인
        if data['password'] != data['password2']:
            raise serializers.ValidationError(
                {"password": "Password fields didn't match."})
        
        # 전화번호 유효성 검사 추가
        try:
            phone_number = parse(data['phone_number'], "KR")  # "KR"은 국가 코드
            if not is_valid_number(phone_number):
                raise serializers.ValidationError({"phone_number": "Invalid phone number."})
        except Exception:
            raise serializers.ValidationError({"phone_number": "Invalid phone number format."})

        return data

    def create(self, validated_data):
        # CREATE 요청에 대해 create 메서드를 오버라이딩하여, 유저를 생성하고 토큰도 생성하게 해준다.
        phone_number = parse(validated_data['phone_number'], "KR")  # "KR"은 국가 코드
        e164_phone_number = format_number(phone_number, PhoneNumberFormat.E164)

        user = CustomUser.objects.create_user(
            username=validated_data['username'],
            name=validated_data['name'],
            birthdate=validated_data['birthdate'],
            phone_number=e164_phone_number,
            address=validated_data['address'],
            password=validated_data['password']
        )

        user.set_password(validated_data['password'])
        user.save()
        token = Token.objects.create(user=user)
        return user

class LoginSerializer(serializers.Serializer):
    username = serializers.CharField(required=True)
    password = serializers.CharField(required=True, write_only=True)
    
    def validate(self, data):
        user = authenticate(**data)
        if user:
            token, _ = Token.objects.get_or_create(user=user)  # 해당 유저의 토큰을 불러옴
            return {
                'token': token.key,
                'user_id': user.id  # 사용자 ID 추가
            }
        raise serializers.ValidationError( # 가입된 유저가 없을 경우
            {"error": "Unable to log in with provided credentials."}
        )

class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ['username']  # 필요한 필드 추가