import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'dart:convert';


class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // 웹에서는 meta 태그의 client_id를 사용하므로 생략 가능
    // 하지만 다른 플랫폼을 위해 설정할 수도 있습니다
  );

  // 현재 사용자
  User? get currentUser => _auth.currentUser;
  
  // 로그인 상태
  bool get isLoggedIn => currentUser != null;
  
  // 인증 상태 스트림
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // 초기화
  Future<void> initialize() async {
    // Firebase Auth는 자동으로 인증 상태를 관리합니다
  }

  // Google 로그인
  Future<bool> signInWithGoogle() async {
    try {
      // 실제 Google 로그인 시도
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // 사용자가 로그인을 취소함
        return false;
      }

      // Google 인증 정보 가져오기
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Firebase 인증 자격증명 생성
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Firebase에 로그인
      await _auth.signInWithCredential(credential);
      return true;
    } catch (e) {
      print('Google 로그인 오류: $e');
      return false;
    }
  }

  // 로그아웃
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      print('로그아웃 오류: $e');
    }
  }

  // 사용자 정보 가져오기
  String? get userDisplayName => currentUser?.displayName;
  String? get userEmail => currentUser?.email;
  String? get userPhotoURL => currentUser?.photoURL;
  String? get userId => currentUser?.uid;
}
