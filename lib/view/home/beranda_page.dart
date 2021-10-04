import 'package:flutter/material.dart';
import 'package:venvice/utils/my_style.dart';
import 'package:get/get.dart';
import 'package:venvice/view/chat/list_chat_page.dart';
import 'package:venvice/view/order/order_page.dart';
import 'package:venvice/view/widgets/card_beranda_item.dart';
import 'package:venvice/view/widgets/outlined_button.dart';

import 'jelajah_page.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  final searchFocus = FocusNode();
  bool isSearchActive = false;

  @override
  void initState() {
    searchFocus.addListener(() {
      setState(() {
        isSearchActive = searchFocus.hasFocus;
      });
    });
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
                width: deviceWidth, height: 100, color: Colors.deepPurple),
            Positioned(
                right: 8,
                top: 26,
                child: IconButton(
                    onPressed: () {
                      print('chat tapped');
                      Get.to(() => ListChatPage());
                    },
                    icon: Icon(
                      Icons.chat_outlined,
                      color: Colors.white,
                    ))),
            Positioned(
              right: 48,
              top: 26,
              child: IconButton(
                onPressed: () {
                  print('cart tapped');
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 24),
                Container(
                  height: 50,
                  child: Container(
                    margin: EdgeInsets.only(right: 100, left: 12),
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
                            focusNode: searchFocus,
                            decoration:
                                MyStyle.myInputDecor('Cari jasa yang kamu mau'),
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () {
                              FocusScope.of(context).nextFocus();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        // card kupon - koin
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 24),
          height: 74,
          decoration: MyStyle.containerOne(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              VenviceCardItem(
                  iconData: Icons.confirmation_num_outlined,
                  valueStr: '40 Kupon',
                  descStr: 'Kupon Jasa Venvice'),
              Spacer(),
              VerticalDivider(
                color: Colors.black54,
              ),
              Spacer(),
              VenviceCardItem(
                  iconData: Icons.monetization_on_outlined,
                  valueStr: '9900 Koin',
                  descStr: 'Hadiah Koin Venvice'),
              Spacer(),
            ],
          ),
        ),

        // item kategori
        Container(
          height: 200,
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 90,
                crossAxisSpacing: 0,
                mainAxisSpacing: 20),
            itemCount: 8,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                  onTap: () {
                    print('item tapped');
                    Get.to(() => OrderPage());
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
                          'Service \nMotor',
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ));
            },
          ),
        ),

        // more btn
        Container(
          height: 50,
          margin: EdgeInsets.only(left: 32, right: 32),
          child: Row(
            children: [
              Spacer(),
              OutlinedBtn('Lebih Banyak', onTap: () {
                Get.to(() => JelajahPage());
              }, radius: 18, dWidth: 110, dHeight: 26)
            ],
          ),
        ),
      ],
    );
  }
}
