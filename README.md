# Django Photo Blog API

Django REST Framework를 사용한 포토 블로그 백엔드 API입니다.

## 기능

- 사진 업로드 및 관리
- RESTful API
- 사용자 인증
- CORS 지원 (안드로이드 앱 연동)

## 설치 방법

1. 저장소 클론
```bash
git clone <repository-url>
cd djangoProject
```

2. 가상환경 생성 및 활성화
```bash
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
```

3. 패키지 설치
```bash
pip install -r requirements.txt
```

4. 마이그레이션 실행
```bash
python manage.py migrate
```

5. 슈퍼유저 생성
```bash
python manage.py createsuperuser
```

6. 서버 실행
```bash
python manage.py runserver
```

## API 엔드포인트

- `/api/photos/` - 사진 목록 및 생성
- `/api/photos/{id}/` - 사진 상세, 수정, 삭제
- `/api/photos/my_photos/` - 내 사진 목록
- `/api/users/` - 사용자 목록

## 관리자 페이지

- `/admin/` - Django 관리자 페이지