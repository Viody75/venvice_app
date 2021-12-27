import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venvice/utils/my_style.dart';
import 'package:venvice/view/widgets/outlined_button.dart';

class DetailTransactionPage extends StatefulWidget {
  const DetailTransactionPage({Key? key}) : super(key: key);

  @override
  _DetailTransactionPageState createState() => _DetailTransactionPageState();
}

class _DetailTransactionPageState extends State<DetailTransactionPage> {
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
                        'Detail Transaksi',
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
                      // detail pesanan
                      Container(
                        width: deviceWidth,
                        height: 120,
                        decoration: MyStyle.containerShadow(),
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(),
                            Text(
                              'Detail pesanan',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Text(
                                  'Order Id',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Spacer(),
                                Text(
                                  'LTP-123123123',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Order Id',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Spacer(),
                                Text(
                                  'LTP-123123123',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),

                      // daftar belanja
                      Container(
                        width: deviceWidth,
                        height: 120,
                        decoration: MyStyle.containerShadow(),
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(),
                            Text(
                              'Daftar belanja',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Text(
                                  '1 X Ganti LCD',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Spacer(),
                                Text(
                                  'Rp300.000',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  '1 X Ganti LCD',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Spacer(),
                                Text(
                                  'Rp300.000',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),

                      // daftar belanja
                      Container(
                        width: deviceWidth,
                        height: 240,
                        decoration: MyStyle.containerShadow(),
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(),
                            Text(
                              'Detail pembayaran',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Text(
                                  'Total harga (estimasi)',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Spacer(),
                                Text(
                                  'Rp112.356',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Biaya jalan',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Spacer(),
                                Text(
                                  'Rp300.000',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Biaya aplikasi',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Spacer(),
                                Text(
                                  'Rp300.000',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Potongan promo',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Spacer(),
                                Text(
                                  'Rp300.000',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Total Pembayaran',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  'Rp3.000.000',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: double.infinity,
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
                            Spacer(),
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
