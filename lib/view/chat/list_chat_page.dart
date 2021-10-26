import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:venvice/view/chat/chat_page.dart';
import 'package:get/get.dart';

class ListChatPage extends StatelessWidget {
  const ListChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: deviceWidth,
          height: deviceHeight,
          child: Column(
            children: [
              Container(
                width: deviceWidth,
                height: 60,
                color: Colors.deepPurple.shade500,
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Spacer(),
                    Text(
                      'Obrolan',
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
                height: deviceHeight - 60 - 56 - 24,
                padding: EdgeInsets.only(top: 12),
                child: ListView.separated(
                    itemCount: 4,
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => ChatPageView());
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(50)),
                                // child: Image.network(''),
                              ),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Viody Alfaridzi',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 6),
                                  Text('Kira-kira akan sampai jam 2...')
                                ],
                              ),
                              Spacer(),
                              Text('12:00 PM')
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
