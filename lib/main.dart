import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venvice/splashscreen.dart';
import 'package:venvice/view/auth/auth-email-page.dart';
import 'package:venvice/view/auth/auth-num-page.dart';
import 'package:venvice/view/auth/choose-auth-page.dart';
import 'package:venvice/view/auth/register-page.dart';
import 'package:venvice/view/auth/verify-acc-page.dart';
import 'package:venvice/view/home/main_menu_page.dart';
import 'package:venvice/view/test_lab/tes-fcm-page.dart';
import 'package:venvice/welcome-page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  // aktifkan fcm
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  late String fcmToken;
  Future<void> activedFCM() async {
    Firebase.initializeApp();
    firebaseMessaging.getToken().then((value) {
      print(value);
      fcmToken = value!;
      print('script : firebaseMessaging.getToken() -> run!');
    });

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    Future.delayed(const Duration(milliseconds: 1000), () {
      print('script : FirebaseMessaging.onMessage.listen');
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Got a message whilst in the foreground!');
        print('Message data: ${message.data}');
        Get.snackbar(
            "${message.notification!.title}", "${message.notification!.body}",
            backgroundColor: Colors.white,
            borderColor: Colors.deepPurple,
            borderWidth: 0.7);

        if (message.notification != null) {
          print(
              'Message also contained a notification: ${message.notification}');
        }
      });
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
  }

  @override
  Widget build(BuildContext context) {
    activedFCM();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.deepPurple, fontFamily: ''),
      home: SplashscreenPage(),
      routes: <String, WidgetBuilder>{
        '/splashscreen-page': (BuildContext context) => SplashscreenPage(),
        '/welcome-page': (BuildContext context) => WelcomePage(
              title: 'venvice app',
            ),
        '/choose-auth-page': (BuildContext context) => ChooseAuthPage(),
        '/auth-email-page': (BuildContext context) => AuthEmailPage(),
        '/auth-number-page': (BuildContext context) => AuthNumberPage(),
        '/auth-google-page': (BuildContext context) => AuthEmailPage(),
        '/register-page': (BuildContext context) => RegisterPage(),
        '/verify-acc-page': (BuildContext context) => VerifyAccount(),
        '/beranda-page': (BuildContext context) => MainMenuPage(),
        '/tes-fcm-page': (BuildContext context) => TesFCM(),
        // '/b': (BuildContext context) => MyPage(title: 'page B'),
      },
    );
  }
}
