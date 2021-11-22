import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venvice/controller/cart_page_controller.dart';
import 'package:venvice/controller/order_page_controller.dart';
import 'package:venvice/utils/my_style.dart';
import 'package:venvice/view/widgets/card_beranda_item.dart';
import 'package:venvice/view/widgets/coloured_button.dart';
import 'package:venvice/view/widgets/outlined_button.dart';
import 'package:venvice/view/widgets/plus_minus_button.dart';

import 'order_button.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final OrderPageController _orderPageController =
      Get.put(OrderPageController());
  final searchFocus = FocusNode();
  bool isSearchActive = false;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    print("ini length : ${_orderPageController.cartList.length}");
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: deviceWidth,
              height: deviceHeight,
              child: ListView(children: [
                // top-nav
                Container(
                  width: deviceWidth,
                  margin: EdgeInsets.symmetric(horizontal: 12),
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
                        'Konfirmasi Pesanan',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                    ],
                  ),
                ),

                Container(
                  width: deviceWidth,
                  height: deviceHeight - 60,
                  child: ListView(
                    children: [
                      // card alamat - waktubuka
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        height: 56,
                        decoration: MyStyle.containerOne(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Spacer(),
                            VenviceCardItem(
                                iconData: Icons.location_on,
                                valueStr: 'Lokasi Anda Sekarang',
                                descStr: 'BLK. A No. 81'),
                            Spacer(),
                          ],
                        ),
                      ),

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
                                child: Icon(Icons.note_add_outlined),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                focusNode: searchFocus,
                                decoration: MyStyle.myInputDecor(
                                    'Catatan untuk penyedia jasa'),
                                textInputAction: TextInputAction.next,
                                onEditingComplete: () {},
                              ),
                            ),
                          ],
                        ),
                      ),

                      // daftar pesanan
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(left: 26, right: 26, top: 8),
                        child: Row(
                          children: [
                            Text(
                              'Daftar Pesanan',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            OutlinedBtn('Tambah lagi', onTap: () {
                              Get.back();
                            }, radius: 18, dWidth: 130, dHeight: 26)
                          ],
                        ),
                      ),

                      // list daftar pesanan
                      Container(
                        height: 260,
                        margin: EdgeInsets.only(top: 8, left: 26, right: 26),
                        child: GetBuilder<OrderPageController>(
                          builder: (_) {
                            return ListView.builder(
                                itemCount: _orderPageController.cartList.length,
                                itemBuilder: (context, index) {
                                  var data = _orderPageController.cartList
                                      .firstWhere((e) =>
                                          e.name ==
                                          _orderPageController
                                              .cartList[index].name);
                                  int price = int.parse(
                                      "${_orderPageController.cartList[index].price}");
                                  return Container(
                                    height: 130,
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.network(
                                            _orderPageController
                                                .cartList[index].imageAsset,
                                            width: 120,
                                            height: 120,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Spacer(),
                                            Text(
                                                '${_orderPageController.cartList[index].name}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors
                                                        .deepPurple[400])),
                                            Spacer(),
                                            Text(
                                                'Rp. ${_orderPageController.cartList[index].price},00',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black)),
                                            Spacer(),
                                            Text(
                                                '${_orderPageController.cartList[index].estTime} Menit',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.grey)),
                                            Spacer(),
                                            GetBuilder<OrderPageController>(
                                                builder: (_) {
                                              return PlusMinusButton(
                                                  value: data.qty,
                                                  onTapMin: () {
                                                    _orderPageController
                                                        .decQtyItem(
                                                            _orderPageController
                                                                .cartList[index]
                                                                .name,
                                                            price);
                                                  },
                                                  onTapPlus: () {
                                                    _orderPageController
                                                        .incQtyItem(
                                                            _orderPageController
                                                                .cartList[index]
                                                                .name,
                                                            price);
                                                  });
                                            })
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                        ),
                      ),

                      // Detail Pembayaran
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(left: 26, right: 26, top: 8),
                        child: Row(
                          children: [
                            Text(
                              'Detail Pembayaran',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Spacer()
                          ],
                        ),
                      ),

                      // embel2 harga
                      GetBuilder<OrderPageController>(builder: (_) {
                        return Container(
                          margin: EdgeInsets.only(left: 26, right: 26),
                          child: Column(
                            children: [
                              // total harga
                              Row(
                                children: [
                                  Text(
                                    'Total Harga (estimasi)',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Rp. ${_orderPageController.cartEstAll}',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),

                              SizedBox(height: 6),

                              // biaya jalan
                              Row(
                                children: [
                                  Text(
                                    'Biaya jalan/periksa',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Rp. 10000',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),

                              SizedBox(height: 8),

                              // bayaran
                              Row(
                                children: [
                                  Text(
                                    'Rp. ${_orderPageController.cartEstAll + 10000}  ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  ColouredBtn(
                                      'Tunai', Colors.deepPurple.shade400,
                                      onTap: () {},
                                      radius: 24,
                                      dWidth: 56,
                                      dHeight: 24),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.more_vert))
                                ],
                              ),

                              // pesan button
                              OrderButton(
                                  '${_orderPageController.cartEstAll + 10000}',
                                  () {})
                            ],
                          ),
                        );
                      }),

                      Container(
                        height: 60,
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
