import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venvice/welcome-page.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({Key? key}) : super(key: key);

  @override
  _SplashscreenPageState createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), () {
      Get.to(WelcomePage(title: 'Venvice'));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Ini Splashscreen'),
        ),
      ),
    );
  }
}
