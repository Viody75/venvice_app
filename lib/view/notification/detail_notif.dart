import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailNotificationPage extends StatelessWidget {
  const DetailNotificationPage({Key? key}) : super(key: key);

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
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios_rounded),
                ),
                Text(
                  'Detail Notifikasi',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            ),
          ),
          Container(
            width: deviceWidth,
            height: deviceHeight - 60,
            margin: EdgeInsets.symmetric(horizontal: 18),
            child: ListView(
              children: [
                Text(
                  'Info Penting : Pemeliharan Rutin Sistem Venvice',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore \n\n exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla')
              ],
            ),
          )
        ],
      ),
    );
  }
}
