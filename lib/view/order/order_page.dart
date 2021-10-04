import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venvice/controller/order_page_controller.dart';
import 'package:venvice/utils/my_style.dart';
import 'package:venvice/view/map/map_list_location.dart';
import 'package:venvice/view/widgets/card_beranda_item.dart';
import 'package:venvice/view/widgets/outlined_button.dart';
import 'package:venvice/view/widgets/plus_minus_button.dart';
import 'cart_page.dart';
import 'cart_widget.dart';
import 'loading_order_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final searchFocus = FocusNode();
  final OrderPageController _orderPageController =
      Get.put(OrderPageController());

  bool isSearchActive = false;

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
                        'Salon',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                    ],
                  ),
                ),

                // card alamat - waktubuka
                InkWell(
                  onTap: () {
                    print('Alamat Tapped');
                    Get.to(() => MapListLocation());
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    height: 74,
                    decoration: MyStyle.containerOne(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        VenviceCardItem(
                            iconData: Icons.location_on,
                            valueStr: 'BLK. A No. 81',
                            descStr: 'Lokasi Anda Sekarang'),
                        Spacer(),
                      ],
                    ),
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

                //promo
                Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 26, right: 26, top: 8),
                  child: Row(
                    children: [
                      Text(
                        'Promo Hari ini!',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      OutlinedBtn('Lihat Semua',
                          onTap: () {}, radius: 18, dWidth: 110, dHeight: 26)
                    ],
                  ),
                ),

                //list layanan
                Container(
                    height: 266,
                    margin: EdgeInsets.only(top: 8),
                    child: GetBuilder<OrderPageController>(
                      builder: (_) {
                        return _orderPageController.serviceOrderExist == true
                            ? ListView.builder(
                                itemCount: _orderPageController
                                    .serviceOrderList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(left: 24),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.network(
                                            _orderPageController
                                                    .serviceOrderList[index]
                                                ['avatar'],
                                            width: 120,
                                            height: 120,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "${_orderPageController.serviceOrderList[index]['price_disc']} % Off",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red[900]),
                                        ),
                                        Spacer(),
                                        Text(
                                          'Rp. 50.000',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                        Spacer(),
                                        Text(
                                            "Rp. ${_orderPageController.serviceOrderList[index]['price']}000",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                        Spacer(),
                                        Container(
                                          width: 120,
                                          child: Text(
                                              "${_orderPageController.serviceOrderList[index]['service_name']}",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color:
                                                      Colors.deepPurple[400])),
                                        ),
                                        Spacer(),
                                        Text(
                                            "${_orderPageController.serviceOrderList[index]['est_time']} Menit",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey)),
                                        Spacer(),
                                        GetBuilder<OrderPageController>(
                                            builder: (_) {
                                          var contain = _orderPageController
                                              .cartList
                                              .where((e) =>
                                                  e.name ==
                                                  _orderPageController
                                                          .serviceOrderList[
                                                      index]['service_name']);
                                          if (contain.isEmpty) {
                                            return OutlinedBtn(
                                              'Tambah',
                                              onTap: () {
                                                print('first tambah');
                                                int price = int.parse(
                                                    "${_orderPageController.serviceOrderList[index]['price']}000");
                                                _orderPageController.addItem(
                                                    itemName: _orderPageController
                                                            .serviceOrderList[
                                                        index]['service_name'],
                                                    itemImage:
                                                        _orderPageController
                                                                .serviceOrderList[
                                                            index]['avatar'],
                                                    itemPrice: price,
                                                    itemEstTime:
                                                        _orderPageController
                                                                .serviceOrderList[
                                                            index]['est_time'],
                                                    itemQty: 1);
                                              },
                                              radius: 8,
                                              dHeight: 36,
                                              dWidth: 120,
                                            );
                                          } else {
                                            var data = _orderPageController
                                                .cartList
                                                .firstWhere((e) =>
                                                    e.name ==
                                                    _orderPageController
                                                            .serviceOrderList[
                                                        index]['service_name']);
                                            int price = int.parse(
                                                "${_orderPageController.serviceOrderList[index]['price']}000");
                                            return PlusMinusButton(
                                                value: data.qty,
                                                onTapMin: () {
                                                  _orderPageController.decQtyItem(
                                                      _orderPageController
                                                              .serviceOrderList[
                                                          index]['service_name'],
                                                      price);
                                                },
                                                onTapPlus: () {
                                                  _orderPageController.incQtyItem(
                                                      _orderPageController
                                                              .serviceOrderList[
                                                          index]['service_name'],
                                                      price);
                                                });
                                          }
                                        }),
                                      ],
                                    ),
                                  );
                                })
                            : LoadingOrder();
                      },
                    )),

                //lainya
                Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 26, right: 26, top: 8),
                  child: Row(
                    children: [
                      Text(
                        'Layanan Lainnya',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      OutlinedBtn('Lihat Semua',
                          onTap: () {}, radius: 18, dWidth: 110, dHeight: 26)
                    ],
                  ),
                ),

                Container(
                  height: 80,
                )
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GetBuilder<OrderPageController>(builder: (_) {
              return _orderPageController.cartItemAll != 0
                  ? CartWidget(
                      item: _orderPageController.cartItemAll,
                      est: _orderPageController.cartEstAll,
                      onTap: () {
                        print('testing');
                        Get.to(() => CartPage());
                      },
                    )
                  : Container();
            }))
      ],
    ));
  }
}
