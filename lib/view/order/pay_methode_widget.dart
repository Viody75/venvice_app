import 'package:flutter/material.dart';

class PayMethodItem extends StatelessWidget {
  PayMethodItem({required this.name, required this.onTap, required this.color});
  String name;
  GestureTapCallback onTap;
  Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Row(
          children: [
            SizedBox(width: 12),
            Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: color),
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(width: 12),
            Text(
              name,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
