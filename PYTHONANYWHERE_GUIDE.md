# PythonAnywhere 배포 가이드 (처음부터 끝까지)

## 📋 준비사항
- PythonAnywhere 계정 (wunde)
- GitHub 저장소: https://github.com/wonder002/djangoblog

## 🚀 빠른 시작 (5분)

### 1. PythonAnywhere Bash 콘솔 열기
1. [PythonAnywhere](https://www.pythonanywhere.com) 로그인
2. Dashboard → Consoles → "Bash" 클릭

### 2. 설치 스크립트 실행
Bash 콘솔에 다음 명령어 복사/붙여넣기:

```bash
cd ~ && curl -O https://raw.githubusercontent.com/wonder002/djangoblog/main/pythonanywhere_fresh_start.sh && bash pythonanywhere_fresh_start.sh
```

### 3. Web 앱 설정 (스크립트 실행 후)
1. **Web** 탭으로 이동
2. 기존 앱이 있다면 **Delete** 클릭
3. **Add a new web app** 클릭
4. **Manual configuration** → **Python 3.8** 선택

### 4. 설정 입력
#### Code:
- **Source code**: `/home/wunde/djangoblog`
- **Working directory**: `/home/wunde/djangoblog`

#### Virtualenv:
- **Virtualenv**: `/home/wunde/djangoblog/venv`

### 5. WSGI 파일 수정
1. **WSGI configuration file** 링크 클릭
2. 파일 내용 전체 삭제
3. Bash 콘솔에서 다음 실행:
```bash
cat ~/djangoblog/wsgi_config.txt
```
4. 출력된 내용 복사하여 WSGI 파일에 붙여넣기
5. **Save** 클릭

### 6. Static 파일 설정
Static files 섹션에서 각각 추가:

| URL | Directory |
|-----|-----------|
| /static/ | /home/wunde/djangoblog/static |
| /media/ | /home/wunde/djangoblog/media |

### 7. 완료
페이지 상단의 녹색 **Reload** 버튼 클릭

## ✅ 확인
- 웹사이트: https://wunde.pythonanywhere.com
- 관리자: https://wunde.pythonanywhere.com/admin (admin/admin123)
- API: https://wunde.pythonanywhere.com/api/photos/

## 🔧 문제 해결
에러 발생 시 Bash 콘솔에서:
```bash
cd ~/djangoblog && source venv/bin/activate
pip install -r requirements.txt
python manage.py migrate --settings=djangoProject.settings_production
python manage.py collectstatic --noinput --settings=djangoProject.settings_production
```

그 후 Web 탭에서 **Reload** 클릭