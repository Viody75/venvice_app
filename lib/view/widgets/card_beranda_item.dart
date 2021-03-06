import 'package:flutter/material.dart';
import 'package:venvice/utils/my_style.dart';

class VenviceCardItem extends StatelessWidget {
  VenviceCardItem(
      {required this.iconData, required this.valueStr, required this.descStr});
  IconData iconData;
  String valueStr;
  String descStr;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
          Container(
            width: 280,
            child: Center(
              child: Text(
                descStr,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
