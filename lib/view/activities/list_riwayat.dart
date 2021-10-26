import 'package:flutter/material.dart';
import 'package:venvice/view/widgets/coloured_button.dart';

class ListRiwayat extends StatefulWidget {
  const ListRiwayat({Key? key}) : super(key: key);

  @override
  _ListRiwayatState createState() => _ListRiwayatState();
}

class _ListRiwayatState extends State<ListRiwayat> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      width: deviceWidth,
      height: deviceHeight - 140 - 80,
      child: ListView.separated(
          itemCount: 5,
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemBuilder: (context, index) {
            return Container(
              height: 66,
              child: Row(
                children: [
                  Spacer(),
                  Image.asset(
                    'assets/images/workshop.png',
                    width: 50,
                    height: 50,
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Container(
                        width: 200,
                        child: Text(
                          'Perbaikan Laptop Samsung',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Jasa Sudah Dikerjakan',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        '22 Sept 13:24',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Spacer(),
                  ColouredBtn('Chat', Colors.deepPurple.shade500,
                      onTap: () {}, radius: 18, dWidth: 60, dHeight: 26),
                  Spacer()
                ],
              ),
            );
          }),
    );
  }
}
