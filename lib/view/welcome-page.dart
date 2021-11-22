import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venvice/view/auth/choose-auth-page.dart';
import 'package:venvice/view/auth/choose-reg-page.dart';
import 'package:venvice/view/widgets/indicator-off.dart';
import 'package:venvice/view/widgets/indicator-on.dart';
import 'package:venvice/view/widgets/venvice-button.dart';
import 'package:venvice/view/widgets/venvice-secondary-button.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int pageNumb = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: pageNumb);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'assets/images/vv_logo_venvice.png',
                    width: 120,
                  ),
                ),
                Container(
                  height: 350,
                  child: PageView(
                    onPageChanged: (int page) {
                      setState(() {
                        pageNumb = page;
                      });
                      print(page);
                    },
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    children: <Widget>[
                      Center(
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(height: 50),
                              Image.asset('assets/images/wfh_welcome.png',
                                  width: 200, height: 200),
                              Container(
                                width: 300,
                                child: Text(
                                  'Sibuk WFH di rumah aja, ga berasa AC di rumah kotor karena nyala 24 jam ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Color(0xFF6C757D)),
                                ),
                              ),
                              SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(height: 50),
                              Image.asset(
                                  'assets/images/sekolah_online_welcome.png',
                                  width: 300,
                                  height: 200),
                              Container(
                                width: 300,
                                child: Text(
                                  'Asik sekolah online, sampe lupa cuci sepatu',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Color(0xFF6C757D)),
                                ),
                              ),
                              SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(height: 50),
                              Image.asset('assets/images/keliling_welcome.png',
                                  width: 200, height: 200),
                              Container(
                                width: 300,
                                child: Text(
                                  'Sudah keliling-keliling, tapi masih belum nemu penyedia jasa yg dibutuhin',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Color(0xFF6C757D)),
                                ),
                              ),
                              SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(height: 50),
                              Image.asset('assets/images/venvice_welcome.png',
                                  width: 200, height: 200),
                              Container(
                                width: 300,
                                child: Text(
                                  'Temukan kebutuhan jasa harian, tapi cukup di rumah aja',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Color(0xFF6C757D)),
                                ),
                              ),
                              SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      pageNumb == 0 ? IndicatorOn() : IndicatorOff(),
                      SizedBox(width: 10),
                      pageNumb == 1 ? IndicatorOn() : IndicatorOff(),
                      SizedBox(width: 10),
                      pageNumb == 2 ? IndicatorOn() : IndicatorOff(),
                      SizedBox(width: 10),
                      pageNumb == 3 ? IndicatorOn() : IndicatorOff(),
                    ],
                  ),
                ),
                SizedBox(height: 60),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: VenvicePrimaryBtn(
                    'Masuk',
                    onTap: () {
                      // Get.toNamed('/choose-auth-page');
                      Get.to(ChooseAuthPage());
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: VenviceSecondaryBtn(
                    'Belum punya akun? Daftar',
                    onTap: () {
                      Get.to(ChooseRegisterPage());
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
