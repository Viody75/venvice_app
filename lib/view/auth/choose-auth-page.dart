import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:venvice/utils/my_style.dart';
import 'package:venvice/view/widgets/venvice-secondary-button.dart';

class ChooseAuthPage extends StatefulWidget {
  const ChooseAuthPage({Key? key}) : super(key: key);

  @override
  _ChooseAuthPageState createState() => _ChooseAuthPageState();
}

class _ChooseAuthPageState extends State<ChooseAuthPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  void checkAuth() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.bottomStart,
                end: AlignmentDirectional.topEnd,
                colors: [MyStyle.primaryColor(), MyStyle.primaryColor()],
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                // top-nav
                Container(
                  width: deviceWidth,
                  height: 60,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'assets/images/logo_venvice.png',
                    width: 140,
                    height: 200,
                  ),
                ),
                SizedBox(height: 60),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: VenviceSecondaryBtn(
                    'Email',
                    onTap: () {
                      Get.toNamed('/auth-email-page');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
