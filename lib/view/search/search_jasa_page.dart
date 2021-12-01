import 'package:flutter/material.dart';
import 'package:venvice/controller/beranda_page_controller.dart';
import 'package:venvice/utils/my_style.dart';
import 'package:venvice/view/order/order/order_page.dart';
import 'package:get/get.dart';

class SearchJasaPage extends StatefulWidget {
  const SearchJasaPage({Key? key}) : super(key: key);

  @override
  _SearchJasaPageState createState() => _SearchJasaPageState();
}

class _SearchJasaPageState extends State<SearchJasaPage> {
  final _berandaPageController = Get.find<BerandaPageController>();
  final searchFocus = FocusNode();
  bool isSearchActive = false;
  var argsData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            width: deviceWidth,
            height: deviceHeight,
            child: ListView(
              children: [
                SizedBox(height: 60),

                //search jasa
                Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 26, right: 26, top: 8),
                  decoration: isSearchActive
                      ? MyStyle.textBoxActive()
                      : MyStyle.textBoxInActive(),
                  child: Row(
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
                          focusNode: searchFocus,
                          decoration:
                              MyStyle.myInputDecor('Cari jasa yang kamu mau'),
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () {},
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 26),

                //list layanan promo
                Container(
                  height: 200,
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 90,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 20),
                    itemCount: 8,
                    physics: new NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext ctx, index) {
                      return InkWell(
                          onTap: () {
                            print('item tapped');
                            Get.to(() => OrderPage(), arguments: [
                              "${_berandaPageController.userAddress}",
                              "Service Motor"
                            ]);
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/workshop.png',
                                  width: 50,
                                  height: 50,
                                ),
                                Spacer(),
                                Text(
                                  'service \nmotor',
                                  style: TextStyle(fontSize: 11),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ));
                    },
                  ),
                ),
                SizedBox(height: 84)
              ],
            ),
          ),
        ),

        // judul
        Positioned(
          top: 30,
          left: 0,
          right: 0,
          child: // top-nav
              Container(
            color: Colors.white,
            width: deviceWidth,
            height: 60,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios_rounded),
                ),
                Text(
                  "Pencarian",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
