from django.contrib import admin
from .models import Photo

@admin.register(Photo)
class PhotoAdmin(admin.ModelAdmin):
    list_display = ['title', 'author', 'created_date', 'updated_date']
    list_filter = ['created_date', 'updated_date', 'author']
    search_fields = ['title', 'text']
    raw_id_fields = ['author']
