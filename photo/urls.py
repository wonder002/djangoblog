from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import PhotoViewSet, UserViewSet

router = DefaultRouter()
router.register(r'photos', PhotoViewSet)
router.register(r'users', UserViewSet)

urlpatterns = [
    path('', include(router.urls)),
]