import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venvice/controller/auth_controller.dart';
import 'package:venvice/view/widgets/venvice-button-disabled.dart';
import 'package:venvice/view/widgets/venvice-button.dart';

class AuthEmailPage extends StatefulWidget {
  const AuthEmailPage({Key? key}) : super(key: key);

  @override
  _AuthEmailPageState createState() => _AuthEmailPageState();
}

class _AuthEmailPageState extends State<AuthEmailPage> {
  final _authController = Get.put(AuthController());

  // var for froms
  final emailFocus = FocusNode();
  final passFocus = FocusNode();
  bool formIsDone = false;
  bool isEmailActive = false;
  bool isNamaActive = false;
  bool isPasswordActive = false;

  @override
  void initState() {
    emailFocus.addListener(() {
      setState(() {
        isEmailActive = emailFocus.hasFocus;
      });
      debugPrint('Email : ' + isEmailActive.toString());
    });
    passFocus.addListener(() {
      setState(() {
        isPasswordActive = passFocus.hasFocus;
      });
      debugPrint('Pass : ' + isPasswordActive.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: deviceWidth,
          height: deviceHeight,
          child: ListView(
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
                      icon: Icon(Icons.arrow_back_ios_rounded),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.info_outline_rounded),
                    ),
                  ],
                ),
              ),
              // texts
              Container(
                width: deviceWidth,
                margin: EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Selamat datang!',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Silahkan masuk dengan email yang telah terdaftar',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ),

              // fields
              Container(
                width: deviceWidth,
                margin: EdgeInsets.symmetric(horizontal: 18),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff696F79),
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        width: deviceWidth,
                        height: 60,
                        margin: EdgeInsets.only(top: 8),
                        decoration: isEmailActive ? boxActive() : boxInActive(),
                        child: TextFormField(
                          focusNode: emailFocus,
                          controller: _authController.emailController,
                          decoration: myInputDecor('Masukan email'),
                          textInputAction: TextInputAction.next,
                          validator: (String? value) {
                            return (value != null && value.contains('@'))
                                ? 'Do not use the @ char.'
                                : null;
                          },
                          onEditingComplete: () {
                            FocusScope.of(context).nextFocus();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff696F79),
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        width: deviceWidth,
                        height: 60,
                        margin: EdgeInsets.only(top: 8),
                        decoration:
                            isPasswordActive ? boxActive() : boxInActive(),
                        child: TextFormField(
                          focusNode: passFocus,
                          controller: _authController.passwordController,
                          decoration: myInputDecor('Masukan kata sandi'),
                          onEditingComplete: () {
                            setState(() {
                              formIsDone = true;
                              FocusScope.of(context).unfocus();
                            });
                          },
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // button
              Container(
                  margin: EdgeInsets.all(18),
                  child: formIsDone
                      ? VenvicePrimaryBtn(
                          'Login',
                          onTap: () {
                            _authController.startAuth(
                                _authController.emailController.text,
                                _authController.passwordController.text);
                          },
                        )
                      : VenviceBtnDisabled('Login'))
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration boxInActive() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 1, color: Color(0xff696F79)),
      borderRadius: BorderRadius.circular(12),
    );
  }

  BoxDecoration boxActive() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 1, color: Color(0xff6A65D8)),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    );
  }

  InputDecoration myInputDecor(String hint) {
    return InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding:
            EdgeInsets.only(left: 15, bottom: 20, top: 20, right: 15),
        hintText: '$hint');
  }
}
