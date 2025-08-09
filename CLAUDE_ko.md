# CLAUDE_ko.md

이 파일은 이 저장소의 코드 작업 시 Claude Code (claude.ai/code)에게 가이드를 제공합니다.

## 프로젝트 개요

모의 인증 기능을 갖춘 Flutter 메모 작성 애플리케이션입니다. 사용자가 간단한 Material Design 인터페이스로 메모를 생성, 조회, 삭제할 수 있습니다.

## 개발 명령어

### 필수 명령어
```bash
# 의존성 설치
flutter pub get

# 앱 실행 (포트 8080에서 웹 개발 서버)
flutter run -d web-server --web-port=8080

# 특정 플랫폼에서 실행
flutter run -d chrome        # Chrome 브라우저
flutter run -d windows       # Windows 데스크톱
flutter run -d android       # Android 기기/에뮬레이터

# Flutter 환경 확인
flutter doctor

# 테스트 실행
flutter test

# 코드 이슈 분석
flutter analyze

# 빌드 산출물 정리
flutter clean
```

### 개발 참고사항
- 현재 앱은 모의 인증을 사용합니다 (실제 Firebase 통합 없음)
- 기본 테스트는 포트 8080의 웹 서버를 통해 수행됩니다
- 지원 플랫폼: Android, iOS, Web, Windows, macOS, Linux

## 아키텍처 및 구조

### 애플리케이션 아키텍처
앱은 다음과 같은 간단한 Flutter 아키텍처 패턴을 따릅니다:

- **상태 보유 위젯**: 로컬 상태 관리가 있는 메인 UI 컴포넌트
- **싱글톤 서비스**: 인증 상태 관리를 위한 AuthService
- **로컬 저장소**: 데이터 지속성을 위한 SharedPreferences
- **스트림 기반 상태**: 반응형 인증 상태를 위한 StreamBuilder 사용

### 주요 컴포넌트

#### 인증 흐름
- `AuthWrapper` - 인증 상태를 처리하고 로그인/메인 화면 간 라우팅
- `AuthService` - 모의 사용자 인증과 상태를 관리하는 싱글톤 서비스
- `MockUser` - 인증된 사용자를 나타내는 데이터 모델
- 인증 상태는 SharedPreferences에 지속됩니다

#### 메모 관리
- `Note` - id, 내용, 생성 타임스탬프가 있는 데이터 모델
- `NoteListPage` - 메모 보기 및 관리를 위한 메인 인터페이스
- 메모는 JSON 직렬화를 통해 SharedPreferences를 사용하여 로컬에 저장됩니다

#### UI 컴포넌트
- `LoginPage` - 로딩 상태가 있는 모의 Google 로그인 인터페이스
- `NoteListPage` - 추가/삭제 기능이 있는 카드 기반 메모 목록
- 전체적으로 Material Design 3 테마 적용

### 파일 구조
```
lib/
├── main.dart              # 앱 진입점, 라우팅 및 메모 관리 UI
├── auth_service.dart      # 모의 구현이 있는 인증 서비스
├── firebase_options.dart  # Firebase 구성 (데모 키만)
├── models/               # (현재 비어있음)
└── services/             # (현재 비어있음)
```

### 데이터 흐름
1. 앱이 AuthService를 초기화하고 저장된 인증 상태를 확인
2. AuthWrapper가 인증 스트림을 수신하고 적절한 화면을 표시
3. 메모는 JSON 직렬화를 통해 SharedPreferences로 로컬 관리
4. 모든 메모 작업은 인증이 필요합니다 (UI에서 강제)

## Firebase 구성

프로젝트에는 Firebase 구성이 포함되어 있지만 현재는 모의 인증을 사용합니다:
- `firebase_options.dart`에는 데모/플레이스홀더 Firebase 구성이 포함됨
- 실제 Firebase 활성화: 데모 키를 실제 Firebase 프로젝트 자격 증명으로 교체
- 인증 방법: Google 로그인이 구성되어 있지만 모의로 처리됨

## 개발 가이드라인

### 코드 스타일
- Flutter lints 사용 (`package:flutter_lints/flutter.yaml`)
- Material Design 3 원칙
- 한국어 UI 텍스트
- 사용자 친화적인 SnackBar 메시지로 오류 처리

### 테스트
- 기본 위젯 테스트 구조가 있지만 현재 앱 기능에 맞게 업데이트 필요
- 현재 테스트는 구식입니다 (메모 앱이 아닌 카운터 앱 테스트)
- 현재 서비스에 대한 단위 테스트가 구현되지 않음

### 보안 고려사항
- 개발/데모 목적의 모의 인증
- 프로덕션 배포 전에 실제 Firebase 키를 적절히 구성해야 함
- 프로덕션 사용을 위해 Firestore 보안 규칙 구현 필요

## 개발 워크플로

1. **설정**: `flutter pub get`을 실행하여 의존성 설치
2. **개발**: 웹 개발을 위해 `flutter run -d web-server --web-port=8080` 사용
3. **테스트**: `flutter test`로 테스트 업데이트 및 실행
4. **분석**: `flutter analyze`를 사용하여 코드 이슈 확인
5. **플랫폼 테스트**: 플랫폼별 실행 명령어를 사용하여 다양한 플랫폼에서 테스트

## 알려진 이슈

- 위젯 테스트가 구식이며 현재 앱 기능에 맞게 업데이트 필요
- Android 개발에는 Android 라이선스 동의 필요 (`flutter doctor --android-licenses`)
- Android Studio가 설치되지 않음 (IntelliJ IDEA 및 VS Code가 사용 가능한 대안)

## 최근 업데이트

- Firebase 의존성이 다시 활성화됨 (실제 Firebase 통합 준비)
- 모의 인증 시스템이 완전히 구현됨
- 로그인 상태에 따른 메모 추가 버튼 동작 개선
- Chrome 브라우저에서 안정적으로 실행됨ㅛ

## 주요 기능

### 현재 구현된 기능
- ✅ 모의 Google 로그인/로그아웃
- ✅ 로컬 메모 저장 및 관리
- ✅ 반응형 Material Design UI
- ✅ 인증 상태 기반 UI 변화
- ✅ 크로스 플랫폼 지원 (웹, 모바일, 데스크톱)

### 추가 가능한 기능
- 실제 Firebase 인증 통합
- Cloud Firestore를 통한 클라우드 메모 동기화
- 메모 편집 기능
- 메모 검색 및 필터링
- 메모 카테고리 분류
- 다크 테마 지원