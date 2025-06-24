#!/bin/bash
# PythonAnywhere 설정 스크립트
# 이 스크립트를 PythonAnywhere Bash 콘솔에서 실행하세요

echo "=== PythonAnywhere Django 설정 시작 ==="

# 1. 홈 디렉토리로 이동
cd ~

# 2. 기존 프로젝트 삭제 (있을 경우)
if [ -d "djangoblog" ]; then
    echo "기존 프로젝트 삭제 중..."
    rm -rf djangoblog
fi

# 3. GitHub에서 클론
echo "GitHub에서 프로젝트 클론 중..."
git clone https://github.com/wonder002/djangoblog.git

# 4. 프로젝트 디렉토리로 이동
cd djangoblog

# 5. 가상환경 생성
echo "가상환경 생성 중..."
python3.8 -m venv venv

# 6. 가상환경 활성화
source venv/bin/activate

# 7. 패키지 설치
echo "패키지 설치 중..."
pip install --upgrade pip
pip install -r requirements.txt

# 8. 정적 파일 디렉토리 생성
mkdir -p static
mkdir -p media

# 9. 데이터베이스 마이그레이션
echo "데이터베이스 설정 중..."
python manage.py migrate

# 10. 정적 파일 수집
echo "정적 파일 수집 중..."
python manage.py collectstatic --noinput

# 11. 슈퍼유저 생성
echo "슈퍼유저 생성 중..."
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'admin@example.com', 'admin123') if not User.objects.filter(username='admin').exists() else None" | python manage.py shell

echo "=== 설정 완료 ==="
echo "이제 PythonAnywhere Web 탭에서 다음을 설정하세요:"
echo "1. Source code: /home/$(whoami)/djangoblog"
echo "2. Working directory: /home/$(whoami)/djangoblog"
echo "3. Virtualenv: /home/$(whoami)/djangoblog/venv"
echo "4. WSGI 파일에 pythonanywhere_wsgi.py 내용 복사"
echo "5. Static files:"
echo "   - URL: /static/ → Directory: /home/$(whoami)/djangoblog/static"
echo "   - URL: /media/ → Directory: /home/$(whoami)/djangoblog/media"