import 'package:flutter/material.dart';
import 'package:venvice/utils/my_style.dart';

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
      height: deviceHeight - 120 - 40,
      padding: EdgeInsets.only(top: 12, bottom: 12),
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: 12);
          },
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              height: 110,
              decoration: MyStyle.containerOne(),
              margin: EdgeInsets.symmetric(horizontal: 12),
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
                      SizedBox(height: 8),
                      Text(
                        'Jasa Sudah Dikerjakan',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
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
                  Container(
                    height: double.infinity,
                    child: Column(
                      children: [
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.chat,
                              color: Colors.deepPurple.shade400,
                            ))
                      ],
                    ),
                  ),
                  Spacer()
                ],
              ),
            );
          }),
    );
  }
}
