// Flutter 메모 앱 위젯 테스트

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_note/main.dart';

void main() {
  testWidgets('Flutter 메모 앱 빌드 테스트', (WidgetTester tester) async {
    // 앱을 빌드하고 기본 프레임 트리거
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    // Material App이 존재하는지 확인
    expect(find.byType(MaterialApp), findsOneWidget);
    
    // Scaffold가 존재하는지 확인
    expect(find.byType(Scaffold), findsOneWidget);
  });

  testWidgets('앱 타이틀 테스트', (WidgetTester tester) async {
    // 앱을 빌드
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    // 몇 번의 추가 pump로 초기화 시간 제공
    for (int i = 0; i < 5; i++) {
      await tester.pump(const Duration(seconds: 1));
    }

    // MaterialApp의 title 속성 확인 (직접적으로는 화면에 보이지 않을 수 있음)
    final MaterialApp app = tester.widget(find.byType(MaterialApp));
    expect(app.title, 'Flutter 메모 앱');
  });

  testWidgets('기본 UI 요소 존재 테스트', (WidgetTester tester) async {
    // 앱을 빌드
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    // 몇 번의 추가 pump로 UI 로딩 시간 제공
    for (int i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }

    // 기본 위젯들이 존재하는지 확인
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    
    // AppBar 또는 기타 기본 요소들 확인
    // CircularProgressIndicator나 기타 로딩 요소가 있을 수 있음
    expect(find.byType(CircularProgressIndicator), findsWidgets);
  });
}