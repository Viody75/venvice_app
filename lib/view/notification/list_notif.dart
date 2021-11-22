import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venvice/utils/my_style.dart';
import 'package:venvice/view/notification/detail_notif.dart';

class ListNotificationPage extends StatelessWidget {
  const ListNotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        Container(
          width: deviceWidth,
          height: 60,
          color: MyStyle.primaryColor(),
          child: Row(
            children: [
              Spacer(),
              Text(
                'Notifikasi',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Spacer(),
            ],
          ),
        ),
        Container(
          width: deviceWidth,
          height: deviceHeight - 140,
          margin: EdgeInsets.only(top: 12),
          child: ListView.separated(
            itemCount: 6,
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(() => DetailNotificationPage());
                },
                child: Container(
                  height: 60,
                  margin: EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 8),
                          Text('Jumat, 23 Sep 13:50',
                              style: TextStyle(color: Colors.grey))
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 300,
                        margin: EdgeInsets.only(left: 24),
                        child: Text('Pemeliharaan Rutin Sistem Venvice',
                            maxLines: 1,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Spacer(),
                      Container(
                        width: 300,
                        margin: EdgeInsets.only(left: 24),
                        child: Text(
                            'Info penting untuk kamu, selengkapnya klik yah blah blah blah blah',
                            maxLines: 1,
                            style: TextStyle(color: Colors.black87)),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
