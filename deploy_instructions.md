# PythonAnywhere 배포 가이드

## 1. PythonAnywhere 계정 설정
1. [PythonAnywhere](https://www.pythonanywhere.com) 가입
2. 무료 계정으로 시작

## 2. 코드 업로드
1. PythonAnywhere 대시보드에서 "Consoles" 탭 클릭
2. "Bash" 콘솔 열기
3. 다음 명령어 실행:
```bash
cd ~
git clone https://github.com/wonder002/djangoblog.git
cd djangoblog
python3.8 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python manage.py migrate
python manage.py collectstatic --noinput
```

## 3. Web 앱 설정
1. "Web" 탭으로 이동
2. "Add a new web app" 클릭
3. Manual configuration 선택 (Python 3.8)
4. 다음 설정:
   - Source code: `/home/wonder002/djangoblog`
   - Working directory: `/home/wonder002/djangoblog`
   - WSGI configuration file: pythonanywhere_wsgi.py 내용 복사
   - Virtualenv: `/home/wonder002/djangoblog/venv`

## 4. Static 파일 설정
Static files 섹션에서:
- URL: `/static/`
- Directory: `/home/wonder002/djangoblog/static`
- URL: `/media/`
- Directory: `/home/wonder002/djangoblog/media`

## 5. 환경 변수 설정
Web 탭에서 환경 변수 추가:
- `DJANGO_SETTINGS_MODULE`: `djangoProject.settings_production`

## 6. 완료
"Reload" 버튼을 클릭하여 앱 재시작

접속 URL: https://wonder002.pythonanywhere.com