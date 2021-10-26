import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venvice/view/activities/list_dalam_proses.dart';
import 'package:venvice/view/activities/list_riwayat.dart';
import 'package:venvice/view/notification/detail_notif.dart';
import 'package:venvice/view/widgets/coloured_button.dart';
import 'package:venvice/view/widgets/outlined_button.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({Key? key}) : super(key: key);

  @override
  _ActivitiesPageState createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  int pageNumb = 0;

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: pageNumb);
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        Container(
          width: deviceWidth,
          height: 60,
          color: Colors.deepPurple.shade500,
          child: Row(
            children: [
              Spacer(),
              Text(
                'Aktifitas',
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
          child: Column(
            children: [
              Container(
                width: deviceWidth,
                height: 80,
                child: Row(
                  children: [
                    SizedBox(width: 12),
                    pageNumb == 0
                        ? ColouredBtn('Riwayat', Colors.deepPurple.shade500,
                            onTap: () {}, radius: 18, dWidth: 80, dHeight: 26)
                        : OutlinedBtn('Riwayat', onTap: () {
                            setState(() {
                              pageController.animateToPage(0,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            });
                            print('btn riwayat pressed : $pageNumb');
                          }, radius: 18, dWidth: 80, dHeight: 26),
                    SizedBox(width: 12),
                    pageNumb == 1
                        ? ColouredBtn(
                            'Dalam Proses', Colors.deepPurple.shade500,
                            onTap: () {}, radius: 18, dWidth: 120, dHeight: 26)
                        : OutlinedBtn('Dalam Proses', onTap: () {
                            setState(() {
                              pageController.animateToPage(1,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            });
                            print('btn dlm proses pressed : $pageNumb');
                          }, radius: 18, dWidth: 120, dHeight: 26)
                  ],
                ),
              ),
              Container(
                width: deviceWidth,
                height: deviceHeight - 140 - 80,
                child: PageView(
                  onPageChanged: (int page) {
                    setState(() {
                      pageNumb = page;
                    });
                    print(page);
                  },
                  controller: pageController,
                  children: [ListRiwayat(), ListDalamProgress()],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
