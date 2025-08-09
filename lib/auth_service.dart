import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';

// Mock User 클래스
class MockUser {
  final String uid;
  final String? displayName;
  final String? email;
  final String? photoURL;

  MockUser({
    required this.uid,
    this.displayName,
    this.email,
    this.photoURL,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'displayName': displayName,
      'email': email,
      'photoURL': photoURL,
    };
  }

  factory MockUser.fromJson(Map<String, dynamic> json) {
    return MockUser(
      uid: json['uid'],
      displayName: json['displayName'],
      email: json['email'],
      photoURL: json['photoURL'],
    );
  }
}

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  MockUser? _currentUser;
  final StreamController<MockUser?> _authStateController =
      StreamController<MockUser?>.broadcast();

  // 현재 사용자
  MockUser? get currentUser => _currentUser;

  // 로그인 상태
  bool get isLoggedIn => currentUser != null;

  // 인증 상태 변경 스트림
  Stream<MockUser?> get authStateChanges => _authStateController.stream;

  // 서비스 초기화 (SharedPreferences에서 사용자 정보 로드)
  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('mock_user');
    if (userJson != null) {
      try {
        _currentUser = MockUser.fromJson(jsonDecode(userJson));
        _authStateController.add(_currentUser);
      } catch (e) {
        // 사용자 정보 로드 오류 발생 (무시)
      }
    }
  }

  // Google 로그인 시뮬레이션
  Future<bool> signInWithGoogle() async {
    try {
      // 로그인 시뮬레이션 (2초 대기)
      await Future.delayed(const Duration(seconds: 2));

      // Mock 사용자 생성
      _currentUser = MockUser(
        uid: 'mock_user_${DateTime.now().millisecondsSinceEpoch}',
        displayName: 'Mock User',
        email: 'mock.user@example.com',
        photoURL: 'https://via.placeholder.com/150',
      );

      // SharedPreferences에 저장
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('mock_user', jsonEncode(_currentUser!.toJson()));

      // 스트림에 변경사항 알림
      _authStateController.add(_currentUser);

      return true;
    } catch (e) {
      // Mock 로그인 오류 발생
      return false;
    }
  }

  // 로그아웃
  Future<void> signOut() async {
    _currentUser = null;

    // SharedPreferences에서 사용자 정보 제거
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('mock_user');

    // 스트림에 변경사항 알림
    _authStateController.add(null);
  }

  // 사용자 정보 접근자
  String? get userDisplayName => currentUser?.displayName;
  String? get userEmail => currentUser?.email;
  String? get userPhotoURL => currentUser?.photoURL;
  String? get userId => currentUser?.uid;

  // 리소스 정리
  void dispose() {
    _authStateController.close();
  }
}
