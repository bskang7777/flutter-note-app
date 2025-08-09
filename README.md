# Flutter 메모 앱

간단한 메모 작성 Flutter 애플리케이션입니다.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)

## 🚀 데모

현재 로컬 개발 환경에서 실행 가능합니다. Firebase 설정 후 온라인 배포가 가능합니다.

## 기능

- ✅ Google 로그인 인증
- ✅ 메모 추가
- ✅ 메모 삭제  
- ✅ 메모 목록 보기
- ✅ 작성 날짜 표시
- ✅ Firebase Firestore를 통한 클라우드 저장
- ✅ 실시간 데이터 동기화
- ✅ 깔끔한 Material Design UI

## 스크린샷

앱은 다음과 같은 기능을 제공합니다:
- 메인 화면에서 모든 메모를 카드 형태로 표시
- '+' 버튼을 눌러 새 메모 추가
- 각 메모에는 삭제 버튼이 있어 불필요한 메모 제거 가능
- 메모가 없을 때는 안내 메시지 표시

## 설치 및 실행

### 사전 요구사항
- Flutter SDK (3.0.0 이상)
- Dart SDK
- Android Studio 또는 VS Code (Flutter 플러그인 설치)
- Firebase 프로젝트 설정

### Firebase 설정

1. [Firebase Console](https://console.firebase.google.com/)에서 새 프로젝트 생성
2. Authentication > Sign-in method에서 Google 로그인 활성화
3. Firestore Database 생성 (테스트 모드로 시작)
4. 프로젝트 설정에서 각 플랫폼별 설정:
   - Web: Web 앱 추가하고 설정 정보 복사
   - Android: Android 앱 추가하고 `google-services.json` 다운로드
   - iOS: iOS 앱 추가하고 `GoogleService-Info.plist` 다운로드

5. `firebase_options.dart` 파일의 설정값을 실제 Firebase 프로젝트 정보로 업데이트:
   ```dart
   // 예시:
   static const FirebaseOptions web = FirebaseOptions(
     apiKey: 'your-actual-api-key',
     appId: 'your-actual-app-id',
     messagingSenderId: 'your-sender-id',
     projectId: 'your-project-id',
     authDomain: 'your-project-id.firebaseapp.com',
     storageBucket: 'your-project-id.appspot.com',
   );
   ```

### 실행 방법

1. 프로젝트 클론 또는 다운로드
2. 프로젝트 디렉토리로 이동
3. Firebase 설정 완료 (위의 Firebase 설정 참고)
4. 의존성 설치:
   ```bash
   flutter pub get
   ```
5. 앱 실행:
   ```bash
   flutter run -d web-server --web-port=8080
   ```
   또는 특정 디바이스에서:
   ```bash
   flutter run -d chrome  # Chrome 브라우저
   flutter run -d windows # Windows 데스크톱
   ```

### 지원 플랫폼
- Android
- iOS  
- Web
- Windows
- macOS
- Linux

## 프로젝트 구조

```
lib/
├── main.dart          # 메인 애플리케이션 파일
└── ...
```

## 사용된 기술

- **Flutter**: UI 프레임워크
- **Firebase**: 백엔드 서비스 (인증, 데이터베이스)
- **Firebase Auth**: Google 로그인 인증
- **Cloud Firestore**: NoSQL 클라우드 데이터베이스
- **Provider**: 상태 관리
- **Material Design 3**: 디자인 시스템

## 주요 클래스

- `MyApp`: 메인 애플리케이션 위젯 (Provider 설정)
- `AuthWrapper`: 로그인 상태에 따른 화면 전환
- `LoginPage`: Google 로그인 화면
- `NoteListPage`: 메모 목록을 표시하는 페이지
- `AuthService`: 인증 관리 서비스
- `NoteService`: Firestore를 통한 메모 데이터 관리
- `Note`: 메모 데이터 모델

## 보안 참고사항

- 실제 배포 시에는 Firestore 보안 규칙을 적절히 설정해야 합니다
- 현재는 개발/테스트 목적으로 설정되어 있습니다
- 프로덕션 환경에서는 Firebase 프로젝트의 보안 설정을 강화하세요

## 라이센스

이 프로젝트는 MIT 라이센스 하에 있습니다. 