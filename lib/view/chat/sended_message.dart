import 'package:flutter/material.dart';

class SendedMessageWidget extends StatelessWidget {
  final String content;
  final String? imageAddress;
  final String time;
  final bool isImage;
  const SendedMessageWidget({
    required this.content,
    required this.time,
    required this.isImage,
    this.imageAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
            right: 8.0, left: 50.0, top: 4.0, bottom: 4.0),
        child: Container(
          // margin: const EdgeInsets.only(left: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12)),
          ),
          child: Stack(children: <Widget>[
            !isImage
                ? Padding(
                    padding: const EdgeInsets.only(
                        right: 12.0, left: 23.0, top: 8.0, bottom: 20.0),
                    child: Text(
                      content,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(
                        right: 12.0, left: 12.0, top: 8.0, bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: Image.asset(
                            '$imageAddress',
                            height: 150,
                            width: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          content,
                        )
                      ],
                    ),
                  ),
            Positioned(
              bottom: 4,
              right: 10,
              child: Text(
                time,
                style: TextStyle(
                    fontSize: 10, color: Colors.black.withOpacity(0.6)),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
