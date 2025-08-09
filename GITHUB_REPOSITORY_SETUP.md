# GitHub 저장소 생성 가이드 (bskang7777)

## 🎯 목표

`bskang7777/flutter-note-app` 저장소를 생성하고 코드를 업로드합니다.

## 📋 단계별 가이드

### 1단계: GitHub 로그인

1. [GitHub.com](https://github.com) 접속
2. `bskang7777` 계정으로 로그인

### 2단계: 새 저장소 생성

1. GitHub 우측 상단 `+` 버튼 클릭
2. `New repository` 선택
3. 저장소 정보 입력:

   ```
   Repository name: flutter-note-app
   Description: Flutter 메모 앱 with Google 로그인
   Public/Private: Public 선택 (GitHub Pages 무료 사용)

   ❌ Add a README file (체크 해제)
   ❌ Add .gitignore (체크 해제)
   ❌ Choose a license (None 선택)
   ```

4. `Create repository` 버튼 클릭

### 3단계: 로컬 코드 업로드

저장소 생성 후 다음 명령어들을 **순서대로** 실행:

```bash
# 1. 원격 저장소 연결 확인 (이미 완료됨)
git remote -v

# 2. 브랜치 확인
git branch

# 3. GitHub에 코드 업로드
git push -u origin main
```

### 4단계: GitHub Pages 활성화

1. 저장소 페이지에서 `Settings` 탭 클릭
2. 왼쪽 메뉴에서 `Pages` 클릭
3. Source 설정:
   - `Deploy from a branch` 선택
   - Branch: `gh-pages` 선택 (Actions가 자동 생성)
   - Folder: `/ (root)` 선택
4. `Save` 버튼 클릭

## 🚀 예상 결과

### 저장소 URL

- **코드**: https://github.com/bskang7777/flutter-note-app
- **웹사이트**: https://bskang7777.github.io/flutter-note-app/

### 자동 배포 프로세스

1. 코드 푸시 → GitHub Actions 트리거
2. Flutter 웹 빌드 → GitHub Pages 배포
3. 약 2-3분 후 웹사이트 접속 가능

## 📁 업로드될 파일 목록

```
flutter_note/
├── .github/workflows/deploy.yml     # 자동 배포 설정
├── lib/                            # Flutter 앱 소스코드
│   ├── main.dart                   # 메인 앱
│   └── auth_service.dart           # 인증 서비스
├── web/                            # 웹 설정
├── windows/                        # Windows 설정
├── README.md                       # 프로젝트 설명
├── CLAUDE_ko.md                    # 개발 가이드
├── DEPLOYMENT.md                   # 배포 가이드
├── pubspec.yaml                    # Flutter 의존성
└── .gitignore                      # Git 제외 파일
```

## ⚠️ 문제 해결

### 푸시 실패 시

```bash
# 강제 푸시 (주의: 기존 데이터 손실 가능)
git push -f origin main
```

### 저장소가 이미 존재하는 경우

1. 기존 저장소 삭제
2. 새로 생성
3. 위 단계 반복

## 📞 지원

저장소 생성 중 문제가 발생하면:

1. GitHub 오류 메시지 확인
2. 저장소 이름 중복 확인
3. 네트워크 연결 상태 확인

---

**현재 상태**: 로컬 코드 준비 완료 ✅  
**다음 단계**: GitHub에서 저장소 생성 후 `git push -u origin main` 실행
