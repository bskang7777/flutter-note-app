# Flutter 메모 앱

간단한 메모 작성 Flutter 애플리케이션입니다.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

## 🚀 데모

- **GitHub Pages**: [flutter-note-app.pages.dev](https://bskang7777.github.io/flutter-note-app/) (자동 배포)
- **로컬 실행**: `flutter run -d web-server --web-port=8080`

## 기능

- ✅ Mock Google 로그인 (실제 인증 없이 시뮬레이션)
- ✅ 메모 추가
- ✅ 메모 삭제
- ✅ 메모 목록 보기
- ✅ 작성 날짜 표시
- ✅ SharedPreferences를 통한 로컬 저장
- ✅ 깔끔한 Material Design UI

## 스크린샷

앱은 다음과 같은 기능을 제공합니다:

- 메인 화면에서 모든 메모를 카드 형태로 표시
- '+' 버튼을 눌러 새 메모 추가
- 각 메모에는 삭제 버튼이 있어 불필요한 메모 제거 가능
- 메모가 없을 때는 안내 메시지 표시
- Mock 로그인으로 간편한 테스트 가능

## 설치 및 실행

### 사전 요구사항

- Flutter SDK (3.0.0 이상)
- Dart SDK
- Android Studio 또는 VS Code (Flutter 플러그인 설치)

### 실행 방법

1. 프로젝트 클론 또는 다운로드
2. 프로젝트 디렉토리로 이동
3. 의존성 설치:
   ```bash
   flutter pub get
   ```
4. 앱 실행:
   ```bash
   flutter run -d web-server --web-port=8080
   ```
   또는 특정 디바이스에서:
   ```bash
   flutter run -d chrome  # Chrome 브라우저
   flutter run -d windows # Windows 데스크톱
   flutter run -d android # Android 기기/에뮬레이터
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
├── auth_service.dart  # Mock 인증 서비스
└── models/            # 데이터 모델
```

## 사용된 기술

- **Flutter**: UI 프레임워크
- **SharedPreferences**: 로컬 데이터 저장
- **Mock Authentication**: 간단한 로그인 시뮬레이션
- **Material Design 3**: 디자인 시스템

## 주요 클래스

- `MyApp`: 메인 애플리케이션 위젯
- `AuthWrapper`: 로그인 상태에 따른 화면 전환
- `LoginPage`: Mock Google 로그인 화면
- `NoteListPage`: 메모 목록을 표시하는 페이지
- `AuthService`: Mock 인증 관리 서비스
- `Note`: 메모 데이터 모델
- `MockUser`: 모의 사용자 데이터 모델

## Mock 인증 시스템

이 앱은 실제 Google 인증 대신 Mock 시스템을 사용합니다:

- "Google로 로그인" 버튼 클릭 시 2초 로딩 후 자동 로그인
- 실제 Google 계정이나 API 키 필요 없음
- 사용자 데이터는 로컬에 저장
- 개발 및 테스트 목적으로 최적화

## 데이터 저장

- **로컬 저장**: SharedPreferences 사용
- **사용자 정보**: 로그인 상태 유지
- **메모 데이터**: JSON 형태로 브라우저/디바이스 로컬 저장
- **오프라인 지원**: 네트워크 연결 없이 작동

## 라이센스

이 프로젝트는 MIT 라이센스 하에 있습니다.