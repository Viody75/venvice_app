import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venvice/utils/my_style.dart';
import 'package:venvice/view/order/payment/pay_methode_widget.dart';

class ChoosePayMethodPage extends StatefulWidget {
  const ChoosePayMethodPage({Key? key}) : super(key: key);

  @override
  _ChoosePayMethodPageState createState() => _ChoosePayMethodPageState();
}

class _ChoosePayMethodPageState extends State<ChoosePayMethodPage> {
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
                        'Metode Pembayaran',
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
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return PayMethodItem(
                          name: 'name', onTap: () {}, color: Colors.orange);
                    },
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
