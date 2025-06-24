import os
import sys

# PythonAnywhere에서 프로젝트 경로 설정
path = '/home/wonder002/djangoblog'
if path not in sys.path:
    sys.path.append(path)

os.environ['DJANGO_SETTINGS_MODULE'] = 'djangoProject.settings_production'

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()