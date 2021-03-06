import 'package:flutter/material.dart';
import 'package:venvice/utils/my_style.dart';

class ReceivedMessageWidget extends StatelessWidget {
  final String content;
  final String? imageAddress;
  final String time;
  final bool isImage;
  const ReceivedMessageWidget({
    required this.content,
    required this.time,
    required this.isImage,
    this.imageAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding:
          const EdgeInsets.only(right: 75.0, left: 8.0, top: 8.0, bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: MyStyle.primaryColor().withOpacity(0.1),
            border: Border.all(width: 1, color: MyStyle.primaryColor()),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12))),
        child: Stack(
          children: <Widget>[
            !isImage
                ? Padding(
                    padding: const EdgeInsets.only(
                        right: 8.0, left: 8.0, top: 8.0, bottom: 20.0),
                    child: Text(
                      content,
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(
                        right: 8.0, left: 8.0, top: 8.0, bottom: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: Image.asset(
                            '$imageAddress',
                            height: 130,
                            width: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          content,
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
            Positioned(
              bottom: 4,
              left: 10,
              child: Text(
                time,
                style: TextStyle(fontSize: 10, color: Colors.deepPurple),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
