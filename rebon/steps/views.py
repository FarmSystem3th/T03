from rest_framework import generics, permissions
from .models import StepCount
from .serializers import StepCountSerializer

class StepCountView(generics.ListCreateAPIView):
    queryset = StepCount.objects.all()
    serializer_class = StepCountSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return StepCount.objects.filter(user=self.request.user)

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)