import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venvice/utils/my_style.dart';

import 'package:venvice/view/widgets/venvice-button.dart';
import 'package:venvice/view/widgets/venvice-secondary-button.dart';

import 'detail_item_coupon.dart';

class CouponDetailPage extends StatefulWidget {
  const CouponDetailPage({Key? key}) : super(key: key);

  @override
  _CouponDetailPageState createState() => _CouponDetailPageState();
}

class _CouponDetailPageState extends State<CouponDetailPage> {
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
                  'Detail Kupon',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            ),
          ),
          Container(
            width: deviceWidth,
            height: deviceHeight - 60,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: MyStyle.containerShadow(),
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
                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          Icon(Icons.date_range),
                          SizedBox(width: 4),
                          Text('Berlaku hingga 6 Okt 2021'),
                          Spacer(),
                          Text('6 Okt 2021'),
                        ],
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                ),

                // details
                SizedBox(height: 12),
                Container(
                  decoration: MyStyle.containerShadow(),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    children: [
                      DetailItemCoupon(
                          iconData: Icons.view_list,
                          itemName: "Syarat dan ketentuan",
                          itemDetail:
                              "Promo berupa kupon diskon 99% dengan masksimal diskon Rp. 50.000",
                          onTap: () {}),
                      DetailItemCoupon(
                          iconData: Icons.live_help,
                          itemName: "Cara pakai",
                          itemDetail:
                              "Masuk ke halaman kupon di beranda lalu pergi ke halaman",
                          onTap: () {}),
                      DetailItemCoupon(
                          iconData: Icons.info,
                          itemName: "Deskripsi kupon",
                          itemDetail:
                              "Nikmati dikon 99% Perbaikan AC (maks. RP5.000)",
                          onTap: () {}),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: VenvicePrimaryBtn(
                    'Pakai Kupon',
                    onTap: () {
                      // Get.to(RegisterPage());
                    },
                  ),
                ),
                SizedBox(height: 50)
              ],
            ),
          )
        ],
      ),
    );
  }
}
