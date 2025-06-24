from .settings import *

DEBUG = False

ALLOWED_HOSTS = ['wunde.pythonanywhere.com']

# Database
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}

# Static files for production
STATIC_ROOT = BASE_DIR / 'static'
STATICFILES_DIRS = []

# Media files
MEDIA_ROOT = BASE_DIR / 'media'

# Security settings
SECURE_SSL_REDIRECT = False
SESSION_COOKIE_SECURE = False
CSRF_COOKIE_SECURE = False