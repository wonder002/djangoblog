# PythonAnywhere 자동 설정 가이드

## 빠른 설정 (5분 소요)

### 1단계: PythonAnywhere 접속
1. https://www.pythonanywhere.com 로그인
2. Dashboard → Consoles → Bash 열기

### 2단계: 자동 설정 스크립트 실행
Bash 콘솔에 다음 명령어를 복사해서 붙여넣기:

```bash
cd ~ && curl -O https://raw.githubusercontent.com/wonder002/djangoblog/main/setup_pythonanywhere.sh && bash setup_pythonanywhere.sh
```

### 3단계: Web 앱 설정 (수동)
1. **Web** 탭 클릭
2. **Add a new web app** 클릭
3. **Next** → **Manual configuration** → **Python 3.8** 선택
4. 다음 설정 입력:

#### Source code
```
/home/wunde/djangoblog
```

#### Working directory  
```
/home/wunde/djangoblog
```

#### WSGI configuration file
WSGI 파일 편집 버튼 클릭 후 내용 전체 삭제하고 다음 내용 붙여넣기:
```python
import os
import sys

path = '/home/wunde/djangoblog'
if path not in sys.path:
    sys.path.append(path)

os.environ['DJANGO_SETTINGS_MODULE'] = 'djangoProject.settings_production'

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()
```

#### Virtualenv
```
/home/wunde/djangoblog/venv
```

### 4단계: Static 파일 설정
Static files 섹션에서 **Enter URL** 클릭하여 추가:

| URL | Directory |
|-----|-----------|
| /static/ | /home/wunde/djangoblog/static |
| /media/ | /home/wunde/djangoblog/media |

### 5단계: 완료
1. 페이지 상단의 **Reload** 버튼 클릭
2. 접속 확인: https://wunde.pythonanywhere.com

## 관리자 계정
- URL: https://wunde.pythonanywhere.com/admin
- ID: admin
- PW: admin123

## API 엔드포인트
- https://wunde.pythonanywhere.com/api/photos/
- https://wunde.pythonanywhere.com/api/users/