# GitHub 배포 가이드

## 🚀 GitHub 저장소 생성 및 배포

### 1단계: GitHub에서 새 저장소 생성

1. [GitHub](https://github.com)에 로그인
2. 우측 상단의 `+` 버튼 클릭 → `New repository` 선택
3. 저장소 정보 입력:
   - **Repository name**: `flutter-note-app`
   - **Description**: `Flutter 메모 앱 with Google 로그인`
   - **Public** 또는 **Private** 선택
   - ⚠️ **Initialize this repository with README** 체크 해제 (이미 로컬에 있음)
4. `Create repository` 클릭

### 2단계: 로컬 저장소를 GitHub에 연결

터미널에서 다음 명령어들을 순서대로 실행하세요:

```bash
# GitHub 저장소를 원격으로 추가 (YOUR_USERNAME을 실제 GitHub 사용자명으로 변경)
git remote add origin https://github.com/YOUR_USERNAME/flutter-note-app.git

# 기본 브랜치를 main으로 설정
git branch -M main

# GitHub에 코드 업로드
git push -u origin main
```

### 3단계: GitHub Pages 배포 (선택사항)

Flutter 웹 앱을 GitHub Pages로 배포하려면:

1. 저장소 설정에서 `Pages` 섹션으로 이동
2. Source를 `Deploy from a branch` 선택
3. Branch를 `gh-pages` 선택 (생성해야 함)

### 4단계: 자동 배포 설정

GitHub Actions를 사용한 자동 배포를 위해 `.github/workflows/deploy.yml` 파일을 생성할 수 있습니다.

## 📋 현재 상태

✅ **완료된 작업:**

- Git 저장소 초기화
- 모든 파일 커밋 완료
- .gitignore 설정
- README.md 업데이트

⏳ **수동으로 해야 할 작업:**

- GitHub에서 새 저장소 생성
- 원격 저장소 연결
- 코드 푸시

## 🔧 Firebase 설정 (실제 배포용)

실제 Firebase 연동을 위해서는:

1. [Firebase Console](https://console.firebase.google.com/)에서 프로젝트 생성
2. `lib/firebase_options.dart`의 설정값을 실제 값으로 교체
3. Authentication → Sign-in method에서 Google 로그인 활성화
4. Firestore Database 생성

## 📱 지원 플랫폼

- ✅ **Web**: GitHub Pages 또는 Firebase Hosting
- ✅ **Android**: Google Play Store
- ✅ **iOS**: App Store
- ✅ **Windows**: Microsoft Store
- ✅ **macOS**: Mac App Store
- ✅ **Linux**: Snap Store

## 🎯 다음 단계

1. GitHub 저장소 생성
2. 코드 푸시
3. Firebase 실제 설정
4. 배포 플랫폼 선택 및 배포
