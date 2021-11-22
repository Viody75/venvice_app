import 'package:flutter/material.dart';
import 'package:venvice/utils/my_style.dart';

class CartWidget extends StatelessWidget {
  CartWidget({required this.item, required this.est, required this.onTap});
  int item;
  int est;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      decoration: MyStyle.containerTwo(Colors.deepPurple.shade400),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$item Item | Rp. $est,00 (est)',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Harga yang tertera merupakan estimasi',
                style: TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
          Spacer(),
          IconButton(
              onPressed: onTap,
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
