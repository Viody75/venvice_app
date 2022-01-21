import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:venvice/utils/my_style.dart';

class BerandaPageController extends GetxController {
  late Position userPosition;
  late String userAddress;

  @override
  void onInit() async {
    // TODO: implement onInit
    getUserAddress();
    getStorage().then((value) => getBerandaData());
    super.onInit();
  }

  String userToken = '';
  Future<void> getStorage() async {
    final box = GetStorage();
    userToken = box.read('userToken');
  }

  void getUserAddress() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double userLatitude = position.latitude;
    double userLongitude = position.longitude;

    List<Placemark> placemarks =
        await placemarkFromCoordinates(userLatitude, userLongitude);

    print("Lat-Long User : $userLatitude, $userLongitude");

    Placemark userAddresses = placemarks[0];
    userAddress = userAddresses.street!;
    print("Lokasi User : ${userAddresses.street}");
  }

  List<dynamic> listArticles = [];
  bool articlesExist = false;
  List<dynamic> listJasa = [];
  bool jasaExist = false;
  Future<void> getBerandaData() async {
    Uri url = Uri.parse('http://192.168.1.2:4000/beranda');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var response = await http.get(url, headers: headers);

    Map<String, dynamic> responseBody = json.decode(response.body);
    if (responseBody["success"] == true) {
      print("INFO : Get data success");
      listArticles = responseBody["artikel"];
      articlesExist = true;
      listJasa = responseBody["jasa"];
      jasaExist = true;
      update();
    } else {
      print("INFO : Get data failed");
    }
  }
}
