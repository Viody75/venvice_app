import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venvice/view/widgets/venvice-button-disabled.dart';
import 'package:venvice/view/widgets/venvice-button.dart';

class AuthNumberPage extends StatefulWidget {
  const AuthNumberPage({Key? key}) : super(key: key);

  @override
  _AuthNumberPageState createState() => _AuthNumberPageState();
}

class _AuthNumberPageState extends State<AuthNumberPage> {
  final numberFocus = FocusNode();
  bool formIsDone = false;
  bool isNumberActive = false;

  @override
  void initState() {
    numberFocus.addListener(() {
      setState(() {
        isNumberActive = numberFocus.hasFocus;
      });
      debugPrint('Number : ' + isNumberActive.toString());
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
                        decoration:
                            isNumberActive ? boxActive() : boxInActive(),
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
                                decoration:
                                    myInputNumberDecor('Masukan nomor ponsel'),
                                textInputAction: TextInputAction.next,
                                validator: (String? value) {
                                  return (value != null &&
                                          value.contains('+62'))
                                      ? 'Tidak Menggunakan +62'
                                      : null;
                                },
                                onEditingComplete: () {
                                  FocusScope.of(context).nextFocus();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Spacer(),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Lupa nomor?',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff6A65D8)),
                              ),
                            ),
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
                          'Selanjutnya',
                          onTap: () {},
                        )
                      : VenviceBtnDisabled('Selanjutnya'))
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
