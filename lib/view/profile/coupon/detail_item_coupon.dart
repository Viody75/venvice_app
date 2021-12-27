import 'package:flutter/material.dart';
import 'package:venvice/utils/my_style.dart';

class DetailItemCoupon extends StatelessWidget {
  DetailItemCoupon(
      {required this.iconData,
      required this.itemName,
      required this.itemDetail,
      required this.onTap});
  IconData iconData;
  String itemName;
  String itemDetail;
  GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            Column(
              children: [
                Icon(
                  iconData,
                  color: MyStyle.primaryColor(),
                  size: 30,
                ),
                Spacer()
              ],
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(itemName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(
                      itemDetail,
                      maxLines: 2,
                      style: TextStyle(color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
