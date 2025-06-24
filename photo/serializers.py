from rest_framework import serializers
from django.contrib.auth.models import User
from .models import Photo

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email']

class PhotoSerializer(serializers.ModelSerializer):
    author = UserSerializer(read_only=True)
    
    class Meta:
        model = Photo
        fields = ['id', 'author', 'title', 'text', 'image', 'created_date', 'updated_date']
        read_only_fields = ['created_date', 'updated_date']