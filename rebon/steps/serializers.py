from rest_framework import serializers
from .models import StepCount

class StepCountSerializer(serializers.ModelSerializer):

    class Meta:
        model = StepCount
        fields = ['user', 'data', 'step_count']