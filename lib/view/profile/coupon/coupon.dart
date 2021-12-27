import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venvice/utils/my_style.dart';

import 'package:venvice/view/widgets/venvice-button.dart';

import 'detail_coupon_page.dart';

class CouponPage extends StatelessWidget {
  const CouponPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
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
                  'Kupon Saya',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            ),
          ),
          Container(
            width: deviceWidth,
            height: deviceHeight - 60,
            child: ListView.builder(itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: MyStyle.containerOne(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      child: Image(
                        image: NetworkImage(
                            'https://www.tutorialkart.com/img/hummingbird.png'),
                        fit: BoxFit.fill,
                        height: 100,
                        width: double.infinity,
                      ),
                    ),
                    Text(
                      'Perbaikan AC',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text('Diskon 99% Perbaikan AC (Max. Rp. 5.000)',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Row(
                      children: [
                        Icon(Icons.date_range),
                        SizedBox(width: 4),
                        Text('Berlaku hingga 6 Okt 2021'),
                        Spacer(),
                        Container(
                          width: 80,
                          child: VenvicePrimaryBtn(
                            'Pakai',
                            onTap: () {
                              Get.to(() => CouponDetailPage());
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 12)
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
