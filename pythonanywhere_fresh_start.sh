#!/bin/bash
# PythonAnywhere 완전 초기화 및 Django 포토 블로그 설치 스크립트
# 이 스크립트를 PythonAnywhere Bash 콘솔에서 실행하세요

echo "==================================="
echo "Django 포토 블로그 설치 시작"
echo "==================================="

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# 1. 홈 디렉토리로 이동
cd ~

# 2. 기존 프로젝트들 정리
echo -e "${YELLOW}기존 프로젝트 정리 중...${NC}"
if [ -d "djangoblog" ]; then
    rm -rf djangoblog
fi
if [ -d "my_first_blog" ]; then
    rm -rf my_first_blog
fi

# 3. GitHub에서 프로젝트 클론
echo -e "${GREEN}GitHub에서 프로젝트 다운로드 중...${NC}"
git clone https://github.com/wonder002/djangoblog.git
cd djangoblog

# 4. Python 3.8 가상환경 생성
echo -e "${GREEN}Python 가상환경 생성 중...${NC}"
python3.8 -m venv venv

# 5. 가상환경 활성화
source venv/bin/activate

# 6. pip 업그레이드
echo -e "${GREEN}pip 업그레이드 중...${NC}"
pip install --upgrade pip

# 7. 패키지 설치
echo -e "${GREEN}필요한 패키지 설치 중...${NC}"
pip install -r requirements.txt

# 8. 디렉토리 생성
echo -e "${GREEN}필요한 디렉토리 생성 중...${NC}"
mkdir -p static
mkdir -p media
mkdir -p media/photos

# 9. 데이터베이스 설정
echo -e "${GREEN}데이터베이스 설정 중...${NC}"
python manage.py migrate --settings=djangoProject.settings_production

# 10. 정적 파일 수집
echo -e "${GREEN}정적 파일 수집 중...${NC}"
python manage.py collectstatic --noinput --settings=djangoProject.settings_production

# 11. 슈퍼유저 생성
echo -e "${GREEN}관리자 계정 생성 중...${NC}"
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.filter(username='admin').exists() or User.objects.create_superuser('admin', 'admin@example.com', 'admin123')" | python manage.py shell --settings=djangoProject.settings_production

# 12. WSGI 파일 내용 생성
echo -e "${GREEN}WSGI 설정 파일 생성 중...${NC}"
cat > ~/djangoblog/wsgi_config.txt << 'EOF'
import os
import sys

# 프로젝트 경로 추가
path = '/home/wunde/djangoblog'
if path not in sys.path:
    sys.path.append(path)

# Django 설정 파일 지정
os.environ['DJANGO_SETTINGS_MODULE'] = 'djangoProject.settings_production'

# WSGI 애플리케이션
from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()
EOF

echo ""
echo -e "${GREEN}==================================="
echo "설치 완료!"
echo "===================================${NC}"
echo ""
echo -e "${YELLOW}다음 단계를 따라 설정을 완료하세요:${NC}"
echo ""
echo "1. PythonAnywhere 대시보드에서 'Web' 탭 클릭"
echo "2. 기존 웹앱이 있다면 'Delete' 후 새로 생성"
echo "3. 'Add a new web app' 클릭"
echo "4. 'Next' → 'Manual configuration' → 'Python 3.8' 선택"
echo ""
echo -e "${YELLOW}5. Web 탭에서 다음 설정:${NC}"
echo "   - Source code: /home/wunde/djangoblog"
echo "   - Working directory: /home/wunde/djangoblog"  
echo "   - Virtualenv: /home/wunde/djangoblog/venv"
echo ""
echo -e "${YELLOW}6. WSGI configuration file 수정:${NC}"
echo "   - 'WSGI configuration file' 링크 클릭"
echo "   - 파일 내용 전체 삭제"
echo "   - 아래 명령어로 내용 확인 후 복사:"
echo -e "${GREEN}   cat ~/djangoblog/wsgi_config.txt${NC}"
echo ""
echo -e "${YELLOW}7. Static files 설정:${NC}"
echo "   URL: /static/ → Directory: /home/wunde/djangoblog/static"
echo "   URL: /media/  → Directory: /home/wunde/djangoblog/media"
echo ""
echo -e "${YELLOW}8. 페이지 상단의 녹색 'Reload' 버튼 클릭${NC}"
echo ""
echo -e "${GREEN}접속 정보:${NC}"
echo "웹사이트: https://wunde.pythonanywhere.com"
echo "관리자: https://wunde.pythonanywhere.com/admin"
echo "ID: admin / PW: admin123"
echo ""
echo -e "${GREEN}API 엔드포인트:${NC}"
echo "- https://wunde.pythonanywhere.com/api/photos/"
echo "- https://wunde.pythonanywhere.com/api/users/"