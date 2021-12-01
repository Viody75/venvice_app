import 'package:flutter/material.dart';
import 'package:venvice/utils/my_style.dart';

class OrderButton extends StatelessWidget {
  OrderButton(this.item1, this.onTap);
  var item1;
  GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 24),
      decoration: MyStyle.containerTwo(MyStyle.primaryColor()),
      child: Row(
        children: [
          Text(
            'Pesan',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
            'Rp. $item1',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: onTap,
              icon: Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
