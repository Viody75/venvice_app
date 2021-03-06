import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venvice/controller/auth_controller.dart';
import 'package:venvice/view/auth/auth-email-page.dart';
import 'package:venvice/view/widgets/venvice-button-disabled.dart';
import 'package:venvice/view/widgets/venvice-button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _authController = Get.put(AuthController());

  // var for forms
  final nameFocus = FocusNode();
  final emailFocus = FocusNode();
  final passFocus = FocusNode();
  final passVerifFocus = FocusNode();
  final numberFocus = FocusNode();
  bool formIsDone = false;
  bool isEmailActive = false;
  bool isNameActive = false;
  bool isPasswordActive = false;
  bool isPasswordVerifActive = false;
  bool isNumberActive = false;

  bool isChecked = false;

  @override
  void initState() {
    nameFocus.addListener(() {
      setState(() {
        isNameActive = nameFocus.hasFocus;
      });
      debugPrint('name : ' + isNameActive.toString());
    });
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
    passVerifFocus.addListener(() {
      setState(() {
        isPasswordVerifActive = passVerifFocus.hasFocus;
      });
      debugPrint('PassVerif : ' + isPasswordVerifActive.toString());
    });
    numberFocus.addListener(() {
      setState(() {
        isNumberActive = numberFocus.hasFocus;
      });
      debugPrint('number : ' + isNumberActive.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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

                Container(
                  width: deviceWidth,
                  height: deviceHeight - 60,
                  child: ListView(
                    children: [
                      // texts
                      Container(
                        width: deviceWidth,
                        height: 90,
                        margin: EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 18,
                            ),
                            Text(
                              'Daftar',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              'Silahkan lengkapi data dirimu di bawah ini',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
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
                                'Nama Lengkap',
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
                                    isNameActive ? boxActive() : boxInActive(),
                                child: TextFormField(
                                  focusNode: nameFocus,
                                  controller: _authController.nameController,
                                  decoration:
                                      myInputDecor('Masukan Nama Lengkap Anda'),
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () {
                                    FocusScope.of(context).nextFocus();
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 18,
                              ),
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
                                decoration:
                                    isEmailActive ? boxActive() : boxInActive(),
                                child: TextFormField(
                                  focusNode: emailFocus,
                                  controller: _authController.emailController,
                                  decoration: myInputDecor('Masukan Email'),
                                  textInputAction: TextInputAction.next,
                                  validator: (String? value) {
                                    return (value != null &&
                                            value.contains('@'))
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
                                'Kata Sandi',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff696F79),
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                width: deviceWidth,
                                height: 60,
                                margin: EdgeInsets.only(top: 8),
                                decoration: isPasswordActive
                                    ? boxActive()
                                    : boxInActive(),
                                child: TextFormField(
                                  focusNode: passFocus,
                                  controller:
                                      _authController.passwordController,
                                  decoration: myInputDecor('Masukan password'),
                                  onEditingComplete: () {
                                    setState(() {
                                      FocusScope.of(context).nextFocus();
                                    });
                                  },
                                  textInputAction: TextInputAction.next,
                                  obscureText: true,
                                ),
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Text(
                                'Ulang Kata Sandi',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff696F79),
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                width: deviceWidth,
                                height: 60,
                                margin: EdgeInsets.only(top: 8),
                                decoration: isPasswordVerifActive
                                    ? boxActive()
                                    : boxInActive(),
                                child: TextFormField(
                                  focusNode: passVerifFocus,
                                  controller:
                                      _authController.rePasswordController,
                                  decoration:
                                      myInputDecor('Masukan ulang password'),
                                  onEditingComplete: () {
                                    setState(() {
                                      FocusScope.of(context).nextFocus();
                                    });
                                  },
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Text(
                                'Nomor Ponsel',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff696F79),
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                width: deviceWidth,
                                height: 60,
                                margin: EdgeInsets.only(top: 8),
                                decoration: isNumberActive
                                    ? boxActive()
                                    : boxInActive(),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 60,
                                      child: Center(
                                        child: Row(
                                          children: [
                                            SizedBox(width: 6),
                                            Image.asset(
                                              'assets/images/indoflag.png',
                                              width: 24,
                                            ),
                                            SizedBox(width: 6),
                                            Text(
                                              '+62',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            VerticalDivider(
                                              thickness: 2,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      height: 60,
                                      child: TextFormField(
                                        focusNode: numberFocus,
                                        keyboardType: TextInputType.number,
                                        controller:
                                            _authController.noHpController,
                                        decoration: myInputNumberDecor(
                                            'Masukan nomor ponsel'),
                                        textInputAction: TextInputAction.done,
                                        onEditingComplete: () {
                                          FocusScope.of(context).unfocus();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: deviceWidth,
                                height: 60,
                                margin: EdgeInsets.only(top: 8),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: isChecked,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isChecked = value!;
                                            formIsDone = true;
                                          });
                                          print("checkbox : $isChecked");
                                        }),
                                    Container(
                                      width: deviceWidth - 100,
                                      child: Text(
                                          'Dengan mendaftar, anda menyetujui Syarat dan Ketentuan serta Kebijakan Privasi'),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      // button
                      Container(
                          margin: EdgeInsets.all(18),
                          child: formIsDone
                              ? VenvicePrimaryBtn(
                                  'Daftar',
                                  onTap: () {
                                    _authController.startReg(
                                        name:
                                            _authController.nameController.text,
                                        email: _authController
                                            .emailController.text,
                                        password: _authController
                                            .passwordController.text,
                                        noHp: _authController
                                            .passwordController.text);

                                    // Get.toNamed('/verify-acc-page');
                                  },
                                )
                              : VenviceBtnDisabled('Daftar')),
                      SizedBox(height: 36)
                    ],
                  ),
                ),
              ],
            ),
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

  InputDecoration myInputNumberDecor(String hint) {
    return InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.only(bottom: 20, top: 20, right: 15),
        hintText: '$hint');
  }
}
