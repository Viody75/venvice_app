import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venvice/view/main_menu_page.dart';

class VerifyAccount extends StatefulWidget {
  const VerifyAccount({Key? key}) : super(key: key);

  @override
  _VerifyAccountState createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
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
                      'Verifikasi Akun',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Masukkan 6 digit kode yang telah dikirim ke nomor 0812*****890',
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
                        child: TextFormField(
                          focusNode: numberFocus,
                          decoration: myInputDecor('Masukan nomor ponsel'),
                          textInputAction: TextInputAction.next,
                          validator: (String? value) {
                            return (value != null && value.contains('+62'))
                                ? 'Tidak Menggunakan +62'
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
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Get.to(() => MainMenuPage());
                              },
                              child: Text(
                                'Belum dapat kode?',
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

              // // button
              // Container(
              //     margin: EdgeInsets.all(18),
              //     child: formIsDone
              //         ? VenvicePrimaryBtn(
              //             'Selanjutnya',
              //             onTap: () {},
              //           )
              //         : VenviceBtnDisabled('Selanjutnya'))
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
