#!/bin/bash
# PythonAnywhere 문제 해결 스크립트

echo "=== PythonAnywhere 설정 수정 중 ==="

# 1. 홈 디렉토리로 이동
cd ~

# 2. 기존 프로젝트 백업 및 삭제
if [ -d "djangoblog" ]; then
    echo "기존 프로젝트 백업 중..."
    mv djangoblog djangoblog_backup_$(date +%Y%m%d_%H%M%S)
fi

# 3. GitHub에서 새로 클론
echo "GitHub에서 프로젝트 클론 중..."
git clone https://github.com/wonder002/djangoblog.git
cd djangoblog

# 4. Python 3.8 가상환경 생성 (PythonAnywhere 권장)
echo "가상환경 생성 중..."
python3.8 -m venv venv
source venv/bin/activate

# 5. pip 업그레이드
pip install --upgrade pip

# 6. 패키지 설치
echo "패키지 설치 중..."
pip install -r requirements.txt

# 7. 정적/미디어 디렉토리 생성
mkdir -p static
mkdir -p media

# 8. 데이터베이스 마이그레이션
echo "데이터베이스 마이그레이션 중..."
python manage.py migrate --settings=djangoProject.settings_production

# 9. 정적 파일 수집
echo "정적 파일 수집 중..."
python manage.py collectstatic --noinput --settings=djangoProject.settings_production

# 10. 슈퍼유저 생성
echo "슈퍼유저 생성 중..."
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.filter(username='admin').exists() or User.objects.create_superuser('admin', 'admin@example.com', 'admin123')" | python manage.py shell --settings=djangoProject.settings_production

echo "=== 완료! ==="
echo ""
echo "이제 PythonAnywhere Web 탭에서 다음을 설정하세요:"
echo ""
echo "1. Source code: /home/wunde/djangoblog"
echo "2. Working directory: /home/wunde/djangoblog"
echo "3. Virtualenv: /home/wunde/djangoblog/venv"
echo "4. WSGI configuration file에 다음 내용 붙여넣기:"
echo ""
echo "import os"
echo "import sys"
echo ""
echo "path = '/home/wunde/djangoblog'"
echo "if path not in sys.path:"
echo "    sys.path.append(path)"
echo ""
echo "os.environ['DJANGO_SETTINGS_MODULE'] = 'djangoProject.settings_production'"
echo ""
echo "from django.core.wsgi import get_wsgi_application"
echo "application = get_wsgi_application()"
echo ""
echo "5. Static files:"
echo "   URL: /static/ → Directory: /home/wunde/djangoblog/static"
echo "   URL: /media/ → Directory: /home/wunde/djangoblog/media"