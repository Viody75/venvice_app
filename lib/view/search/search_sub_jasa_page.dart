import 'package:flutter/material.dart';
import 'package:venvice/controller/order_page_controller.dart';
import 'package:venvice/utils/my_style.dart';
import 'package:venvice/view/order/cart/cart_page.dart';
import 'package:venvice/view/order/cart/cart_widget.dart';
import 'package:venvice/view/order/order/loading_order_widget.dart';
import 'package:venvice/view/widgets/loading_item.dart';
import 'package:venvice/view/widgets/outlined_button.dart';
import 'package:get/get.dart';
import 'package:venvice/view/widgets/plus_minus_button.dart';

class SearchSubJasaPage extends StatefulWidget {
  const SearchSubJasaPage({Key? key}) : super(key: key);

  @override
  _SearchSubJasaPageState createState() => _SearchSubJasaPageState();
}

class _SearchSubJasaPageState extends State<SearchSubJasaPage> {
  final _orderPageController = Get.find<OrderPageController>();
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
                  margin: EdgeInsets.only(left: 18, right: 18, top: 8),
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
                  margin: EdgeInsets.only(left: 18, right: 18, top: 8),
                  child: Row(
                    children: [
                      Text(
                        'Hasil Pencarian',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      OutlinedBtn('Lihat Semua',
                          onTap: () {}, radius: 18, dWidth: 110, dHeight: 26)
                    ],
                  ),
                ),

                //list layanan promo
                Container(
                    height: 256,
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
                                    margin: EdgeInsets.only(left: 18),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
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
                                            Container(
                                              width: 72,
                                              height: 36,
                                              child: Center(
                                                child: Text(
                                                  "${_orderPageController.serviceOrderList[index]['price_disc']} % Off",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red[900]),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  12),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  12))),
                                            )
                                          ],
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
                                          height: 36,
                                          child: Text(
                                              "${_orderPageController.serviceOrderList[index]['service_name']}",
                                              // overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color:
                                                      Colors.deepPurple[400])),
                                        ),
                                        Spacer(),
                                        Text(
                                            "Kategori ${_orderPageController.serviceOrderList[index]['est_time']}",
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
                  argsData[1],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
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
                        Get.to(() => CartPage(), arguments: ["${argsData[0]}"]);
                      },
                    )
                  : Container();
            }))
      ],
    ));
  }
}
