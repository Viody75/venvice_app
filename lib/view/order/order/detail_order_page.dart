import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venvice/utils/my_style.dart';
import 'package:venvice/view/auth/choose-auth-page.dart';
import 'package:venvice/view/order/payment/choose_pay_method_page.dart';
import 'package:venvice/view/widgets/outlined_button.dart';

class DetailOrderPage extends StatefulWidget {
  const DetailOrderPage({Key? key}) : super(key: key);

  @override
  _DetailOrderPageState createState() => _DetailOrderPageState();
}

class _DetailOrderPageState extends State<DetailOrderPage> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: deviceWidth,
              height: deviceHeight,
              child: ListView(children: [
                // top-nav
                Container(
                  width: deviceWidth,
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  height: 60,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back_ios_rounded),
                      ),
                      Text(
                        'Detail Pesanan',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                    ],
                  ),
                ),

                Container(
                  width: deviceWidth,
                  height: deviceHeight - 60,
                  child: ListView(
                    children: [
                      // container mitra
                      Container(
                        width: deviceWidth,
                        height: 140,
                        decoration: MyStyle.containerShadow(),
                        child: Column(
                          children: [
                            Spacer(),
                            Row(
                              children: [
                                SizedBox(width: 12),
                                Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Nama Mitra',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.chat,
                                      color: MyStyle.primaryColor(),
                                    )),
                                SizedBox(width: 12),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                SizedBox(width: 12),
                                Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Nama Rekan Mitra',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                SizedBox(width: 12),
                              ],
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),

                      // container lokasi pengerjaan
                      Container(
                        width: deviceWidth,
                        height: 60,
                        decoration: MyStyle.containerShadow(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Lokasi Pengerjaan',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Jl. Suka Maju Mundur RT. 75, No. 75',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),

                      // container detail pesanan
                      Container(
                        width: deviceWidth,
                        height: 110,
                        decoration: MyStyle.containerShadow(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 12),
                                Text(
                                  'Detail Pesanan',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 18),
                            Row(
                              children: [
                                SizedBox(width: 12),
                                Text(
                                  'Detail Pesanan',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'VIO-12345678',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(width: 12),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                SizedBox(width: 12),
                                Text(
                                  'Tanggal',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '21/05/2001',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(width: 12),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),

                      // container daftar belanja
                      Container(
                        width: deviceWidth,
                        height: 110,
                        decoration: MyStyle.containerShadow(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 12),
                                Text(
                                  'Daftar Belanja',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                OutlinedBtn('Ajukan perubahan', onTap: () {
                                  Get.back();
                                }, radius: 18, dWidth: 150, dHeight: 26),
                                SizedBox(width: 12),
                              ],
                            ),
                            SizedBox(height: 22),
                            Row(
                              children: [
                                SizedBox(width: 12),
                                Text(
                                  '1 x Ganti LCD Lenovo c340',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'Rp80.000',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(width: 12),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                SizedBox(width: 12),
                                Text(
                                  '1 x Ganti LCD Lenovo c340',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'Rp80.000',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(width: 12),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),

                      // container bayar
                      Container(
                        width: deviceWidth,
                        height: 140,
                        decoration: MyStyle.containerShadow(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 12),
                                Text(
                                  'Metode pembayaran',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Container(
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      color: MyStyle.primaryColor()),
                                  child: Center(
                                    child: Text(
                                      'Tunai',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.to(() => ChoosePayMethodPage());
                                  },
                                  icon: Icon(Icons.more_vert),
                                ),
                                SizedBox(width: 12),
                              ],
                            ),

                            // bayar btn
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                    color: MyStyle.primaryColor(),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                child: Row(
                                  children: [
                                    SizedBox(width: 12),
                                    Text(
                                      'Bayar',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Spacer(),
                                    Text(
                                      'Rp5.291.000',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 12),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
