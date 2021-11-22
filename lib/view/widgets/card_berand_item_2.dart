import 'package:flutter/material.dart';
import 'package:venvice/utils/my_style.dart';

class VenviceCardItem2 extends StatelessWidget {
  VenviceCardItem2(
      {required this.iconData, required this.valueStr, required this.descStr});
  IconData iconData;
  String valueStr;
  String descStr;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                iconData,
                color: MyStyle.primaryColor(),
              ),
              SizedBox(width: 6),
              Text(
                valueStr,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          Text(
            descStr,
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
