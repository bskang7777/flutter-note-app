# Google Sign-In 설정 가이드

현재 앱은 개발 환경에서는 임시 익명 로그인을 사용하지만, 실제 Google 로그인을 사용하려면 다음 단계를 따르세요.

## 1. Google Cloud Console 설정

### 1.1 프로젝트 생성
1. [Google Cloud Console](https://console.cloud.google.com/)에 접속
2. 새 프로젝트 생성 또는 기존 프로젝트 선택

### 1.2 Google Sign-In API 활성화
1. "API 및 서비스" → "라이브러리" 이동
2. "Google Sign-In API" 검색 후 활성화

### 1.3 OAuth 2.0 클라이언트 ID 생성
1. "API 및 서비스" → "사용자 인증 정보" 이동
2. "+ 사용자 인증 정보 만들기" → "OAuth 클라이언트 ID" 선택
3. 애플리케이션 유형: "웹 애플리케이션" 선택
4. 이름: "Flutter Note App" (원하는 이름)
5. 승인된 자바스크립트 원본에 다음 추가:
   - `http://localhost:8080`
   - `http://localhost:3000` (필요시)
6. 승인된 리디렉션 URI는 비워둠
7. "만들기" 클릭

### 1.4 클라이언트 ID 복사
생성된 클라이언트 ID를 복사해둡니다. (예: `123456789-abcdef.apps.googleusercontent.com`)

## 2. Firebase Console 설정

### 2.1 Firebase 프로젝트 연결
1. [Firebase Console](https://console.firebase.google.com/)에 접속
2. 기존 Firebase 프로젝트를 Google Cloud 프로젝트와 연결하거나 새로 생성

### 2.2 Authentication 설정
1. Firebase 프로젝트에서 "Authentication" → "Sign-in method" 이동
2. "Google" 제공업체 활성화
3. 웹 SDK 구성에서 위에서 생성한 클라이언트 ID 입력
4. "저장" 클릭

## 3. 앱 설정 업데이트

### 3.1 웹 Client ID 설정
`web/index.html` 파일의 다음 부분을 실제 클라이언트 ID로 교체:

```html
<!-- 현재 -->
<meta name="google-signin-client_id" content="your-client-id.apps.googleusercontent.com">

<!-- 실제 클라이언트 ID로 변경 -->
<meta name="google-signin-client_id" content="123456789-abcdef.apps.googleusercontent.com">
```

### 3.2 Firebase 설정 업데이트
`lib/firebase_options.dart` 파일을 Firebase Console에서 다운로드한 실제 설정으로 교체하거나, Firebase CLI를 사용하여 업데이트:

```bash
firebase login
firebase init
flutter packages get
```

## 4. 테스트

설정 완료 후 앱을 실행:

```bash
flutter run -d web-server --web-port=8080
```

"Google로 로그인" 버튼을 클릭하면 실제 Google 로그인 창이 나타납니다.

## 현재 개발 환경 동작

Client ID가 설정되지 않은 현재 상태에서는:
- 개발 환경(debug mode)에서 익명 로그인이 자동으로 실행됩니다
- "개발 테스트 사용자"라는 이름으로 로그인됩니다
- 실제 Google 계정 정보는 표시되지 않습니다

## 주의사항

- 프로덕션 환경에서는 반드시 실제 Google Client ID를 설정해야 합니다
- Firebase의 Firestore 보안 규칙도 설정해야 합니다
- HTTPS 환경에서 배포시에는 도메인을 승인된 원본에 추가해야 합니다