import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:venvice/controller/beranda_page_controller.dart';
import 'package:venvice/utils/my_style.dart';
import 'package:get/get.dart';
import 'package:venvice/view/order/order/order_page.dart';
import 'package:venvice/view/search/search_jasa_page.dart';
import 'package:venvice/view/widgets/card_berand_item_2.dart';
import 'package:venvice/view/widgets/outlined_button.dart';

import 'more_page.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  final BerandaPageController _berandaPageController =
      Get.put(BerandaPageController());
  bool isSearchActive = false;

  // init fcm
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  Future<void> testSubFCM() async {
    await FirebaseMessaging.instance.subscribeToTopic('cobacoba');
    print('subed to cobacoba');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        // search field - purple container
        Stack(
          children: [
            Container(
              width: deviceWidth,
              height: 100,
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    color: MyStyle.primaryColor(),
                  )),
                ],
              ),
            ),

            // Positioned(
            //     right: 0,
            //     left: 0,
            //     top: 88,
            //     child: Image.asset(
            //       'assets/images/logo_venvice.png',
            //       width: 50,
            //       height: 50,
            //     )),
            //  search bar
            Column(
              children: [
                SizedBox(height: 24),
                Container(
                  height: 50,
                  child: Container(
                    margin: EdgeInsets.only(right: 24, left: 24),
                    decoration: isSearchActive
                        ? MyStyle.textBoxActive()
                        : MyStyle.textBoxInActive(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Center(
                            child: Icon(Icons.search),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            onTap: () {
                              Get.to(() => SearchJasaPage());
                            },
                            readOnly: true,
                            showCursor: false,
                            decoration:
                                MyStyle.myInputDecor('Cari jasa yang kamu mau'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // card kupon - koin
            // Positioned(
            //   left: 0,
            //   right: 0,
            //   top: 130,
            //   child: Container(
            //     margin: EdgeInsets.symmetric(horizontal: 30, vertical: 24),
            //     width: deviceWidth,
            //     height: 74,
            //     decoration: MyStyle.containerOne(),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Spacer(),
            //         VenviceCardItem2(
            //             iconData: Icons.confirmation_num_outlined,
            //             valueStr: '40 Kupon',
            //             descStr: 'Kupon Jasa Venvice'),
            //         Spacer(),
            //         VerticalDivider(
            //           color: Colors.black54,
            //         ),
            //         Spacer(),
            //         VenviceCardItem2(
            //             iconData: Icons.monetization_on_outlined,
            //             valueStr: '9900 Koin',
            //             descStr: 'Hadiah Koin Venvice'),
            //         Spacer(),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),

        // more btn
        SizedBox(height: 12),
        Container(
          height: 40,
          margin: EdgeInsets.only(left: 32, right: 32),
          child: Row(
            children: [
              Spacer(),
              OutlinedBtn('Jelajahi Jasa', onTap: () {
                testSubFCM();
                // Get.to(() => JelajahPage());
              }, radius: 18, dWidth: 112, dHeight: 26),
              Spacer(),
            ],
          ),
        ),
        SizedBox(height: 12),

        // item kategori
        Container(
          height: 200,
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: GetBuilder<BerandaPageController>(builder: (_) {
            return _berandaPageController.jasaExist == true
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 90,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 20),
                    itemCount: _berandaPageController.listJasa.length,
                    physics: new NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext ctx, index) {
                      return InkWell(
                        onTap: () {
                          print('item tapped');
                          Get.to(() => OrderPage(), arguments: [
                            "${_berandaPageController.userAddress}",
                            "${_berandaPageController.listJasa[index]["nama_bidang_jasa"]}"
                          ]);
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/${_berandaPageController.listJasa[index]["icon"]}.png',
                                width: 50,
                                height: 50,
                              ),
                              Spacer(),
                              Text(
                                '${_berandaPageController.listJasa[index]["nama_bidang_jasa"]}',
                                style: TextStyle(fontSize: 11),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Container();
          }),
        ),

        // articles
        Container(
          height: 240,
          width: deviceWidth,
          child: GetBuilder<BerandaPageController>(builder: (_) {
            return ListView.builder(
                itemCount: _berandaPageController.listArticles.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _berandaPageController.articlesExist == true
                      ? Container(
                          width: deviceWidth - 56,
                          margin: EdgeInsets.only(
                              top: 16, bottom: 16, right: 28, left: 28),
                          decoration: MyStyle.containerOne(),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12)),
                                child: Container(
                                  width: deviceWidth - 56,
                                  height: 110,
                                  color: Colors.grey,
                                ),
                                // ganti ke network image
                              ),
                              Spacer(),
                              Container(
                                width: double.infinity,
                                height: 20,
                                margin: EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  "${_berandaPageController.listArticles[index]['judul_artikel']}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: double.infinity,
                                height: 60,
                                margin: EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  '${_berandaPageController.listArticles[index]['deskripsi']}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        )
                      : Container();
                });
          }),
        ),
      ],
    );
  }
}
