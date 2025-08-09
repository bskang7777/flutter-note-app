# Firestore 데이터베이스 스키마

## 컬렉션 구조

```
firestore/
└── users/                          (컬렉션)
    └── {userId}/                    (문서 - Google Auth UID)
        ├── displayName: string      (사용자 표시 이름)
        ├── email: string           (사용자 이메일)
        ├── photoURL: string        (프로필 사진 URL)
        ├── createdAt: timestamp    (계정 생성 시간)
        └── notes/                  (하위 컬렉션)
            └── {noteId}/           (문서 - 자동 생성 ID)
                ├── content: string     (메모 내용, 최대 1000자)
                ├── createdAt: timestamp (메모 작성 시간)
                └── updatedAt: timestamp (메모 수정 시간, 선택사항)
```

## 데이터 타입 및 제약사항

### users/{userId}
- **userId**: Google Auth에서 제공하는 고유 사용자 ID
- **displayName**: 사용자 표시 이름 (최대 100자)
- **email**: 유효한 이메일 주소
- **photoURL**: 프로필 사진 URL (선택사항)
- **createdAt**: 계정 생성 시간

### users/{userId}/notes/{noteId}
- **noteId**: Firestore에서 자동 생성되는 문서 ID
- **content**: 메모 내용
  - 타입: string
  - 필수: true
  - 최소 길이: 1자
  - 최대 길이: 1000자
- **createdAt**: 메모 작성 시간
  - 타입: timestamp
  - 필수: true
- **updatedAt**: 메모 수정 시간
  - 타입: timestamp
  - 필수: false

## 인덱스 설정

Firestore Console에서 다음 복합 인덱스를 생성하세요:

1. **사용자별 메모 정렬용**
   - 컬렉션: `users/{userId}/notes`
   - 필드: `createdAt` (내림차순)

## 보안 규칙

- 인증된 사용자만 자신의 데이터에 접근 가능
- 메모 내용은 1-1000자 제한
- 필수 필드 검증 (content, createdAt)
- 다른 사용자의 데이터 접근 불가

## 클라이언트 코드 예제

### 메모 추가
```dart
await FirebaseFirestore.instance
    .collection('users')
    .doc(userId)
    .collection('notes')
    .add({
  'content': '메모 내용',
  'createdAt': Timestamp.now(),
});
```

### 메모 로드
```dart
final snapshot = await FirebaseFirestore.instance
    .collection('users')
    .doc(userId)
    .collection('notes')
    .orderBy('createdAt', descending: true)
    .get();
```

### 메모 삭제
```dart
await FirebaseFirestore.instance
    .collection('users')
    .doc(userId)
    .collection('notes')
    .doc(noteId)
    .delete();
```