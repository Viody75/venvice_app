import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:venvice/model/order_service_model.dart';

class OrderPageController extends GetxController {
  static var client = http.Client();

  @override
  void onInit() {
    // TODO: implement onInit
    print("isi list cart :");
    fetchDataWaitingJustifikasi();
    for (int i = 0; i < cartList.length; i++) {
      print(
          "[${cartList[i].name}, ${cartList[i].imageAsset}, ${cartList[i].price}, ${cartList[i].estTime}]");
    }
    super.onInit();
  }

  // add Service item
  int cartItemAll = 0;
  int cartEstAll = 0;
  List<OrderCart> cartList = [];
  void addItem(
      {String itemName = '',
      String itemImage = '',
      int itemPrice = 0,
      int itemEstTime = 0,
      int itemQty = 0}) {
    cartItemAll++;
    cartEstAll += itemPrice;
    cartList.add(OrderCart(
        name: itemName,
        imageAsset: itemImage,
        price: itemPrice,
        estTime: itemEstTime,
        qty: itemQty));
    print("isi list cart :");
    for (int i = 0; i < cartList.length; i++) {
      print(
          "[${cartList[i].name}, ${cartList[i].imageAsset}, ${cartList[i].price}, ${cartList[i].estTime}, ${cartList[i].qty}]");
    }
    update();
  }

  void incQtyItem(String byName, int itemPrice) {
    // TODO: search from list cart item by name, then add the qty
    var data = cartList.firstWhere((e) => e.name == byName);
    data.qty += 1;
    cartEstAll += itemPrice;
    cartItemAll++;
    print('${data.name} Qty inc by 1');
    print(data.qty);
    update();
  }

  void decQtyItem(String byName, int itemPrice) {
    var data = cartList.firstWhere((e) => e.name == byName);
    data.qty -= 1;
    cartEstAll -= itemPrice;
    cartItemAll--;
    print('${data.name} Qty dec by 1');
    print(data.qty);
    if (data.qty == 0) {
      cartList.removeWhere((e) => e.name == byName);
    }
    update();
  }

  // fetch Data mockup service
  List<dynamic> serviceOrderList = [];
  bool serviceOrderExist = false;
  void fetchDataWaitingJustifikasi() async {
    Uri url = Uri.parse(
        'https://614d3362e3cf1f001712d051.mockapi.io/vio-api/v1/service');
    print('INFO : Fetch Data -> mock service : $url');
    var response = await client.get(url);

    serviceOrderList = json.decode(response.body);

    if (serviceOrderList.length >= 0) {
      print("INFO : Fetch Data -> Data Exist");
      print(serviceOrderList);
      serviceOrderExist = true;
      print(serviceOrderList[0]['service_name']);
      update();
    } else {
      print("INFO : Fetch Data -> Data Not Exist");
    }
  }
}
