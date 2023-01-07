import 'package:amerixapp/main.dart';
// import 'package:amerixapp/pages/Home/home_page.dart';
import 'package:amerixapp/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // *** All widget Tests shout be done here ***
  testWidgets('Test for main widget', (WidgetTester tester) async {
    //ARRANGE
    await tester.pumpWidget(const MaterialApp(
      home: MyApp(),
    ));

    //ACT
    Finder title = find.byKey(const ValueKey("main widget"));

    //ASSERT
    expect(title, findsOneWidget);
  });

   testWidgets('Test for splash screen widget',
   (WidgetTester tester2) async {
    //ARRANGE
    await tester2.pumpWidget(const SplashScreen());

    //ACT
    Finder title = find.byKey(const ValueKey("Splash screen"));

    //ASSERT
    expect(title, findsOneWidget);
  });

  //Using the MVC pattern (Model, View & Controller);

  // **Home page testing**
  // testWidgets(
  //   "Test for home page",

  //   (WidgetTester tester3) async {
  //     // ARRANGE
  //   await tester3.pumpWidget( MainHome());


  //   // ACT
  //   Finder key = find.byKey(const ValueKey("main"));

  //   //ASSERT
  //   expect(key, findsOneWidget);
  //   }, 
  // );
}
