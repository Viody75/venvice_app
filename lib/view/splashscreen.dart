import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venvice/utils/my_style.dart';
import 'package:venvice/view/welcome-page.dart';

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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: MyStyle.primaryColor(),
        child: Center(
          child: Image.asset(
            'assets/images/venvice-logo-white.png',
            fit: BoxFit.cover,
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
