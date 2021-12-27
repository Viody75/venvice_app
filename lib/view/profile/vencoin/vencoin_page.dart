import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venvice/utils/my_style.dart';

class VencoinPage extends StatefulWidget {
  const VencoinPage({Key? key}) : super(key: key);

  @override
  _VencoinPageState createState() => _VencoinPageState();
}

class _VencoinPageState extends State<VencoinPage> {
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
                  'Vencoin',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            ),
          ),
          Container(
            width: deviceWidth,
            height: deviceHeight - 60,
          )
        ],
      ),
    );
  }
}
