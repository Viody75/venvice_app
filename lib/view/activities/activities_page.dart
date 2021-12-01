import 'package:flutter/material.dart';
import 'package:venvice/utils/my_style.dart';
import 'package:venvice/view/activities/list_dalam_proses.dart';
import 'package:venvice/view/activities/list_riwayat.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({Key? key}) : super(key: key);

  @override
  _ActivitiesPageState createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
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
          height: deviceHeight - 60,
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              body: ListView(
                children: [
                  Container(
                    width: deviceWidth,
                    height: 60,
                    child: TabBar(
                      indicatorColor: MyStyle.primaryColor(),
                      labelColor: MyStyle.primaryColor(),
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          text: 'Riwayat',
                        ),
                        Tab(
                          text: 'Dalam Proses',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: deviceWidth,
                    height: deviceHeight - 120 - 40,
                    child: TabBarView(
                      children: [
                        ListRiwayat(),
                        ListDalamProgress(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
