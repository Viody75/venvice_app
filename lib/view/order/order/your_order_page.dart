import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:venvice/utils/my_style.dart';
import 'package:venvice/view/order/payment/confirm_payment_page.dart';

class YourOrderPage extends StatefulWidget {
  const YourOrderPage({Key? key}) : super(key: key);

  @override
  _YourOrderPageState createState() => _YourOrderPageState();
}

class _YourOrderPageState extends State<YourOrderPage> {
  // vars for map
  late double userLatitude;
  late double userLongitude;
  String userAddress1 = '';
  String userAddress2 = '';
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-1.269160, 116.825264),
    zoom: 12,
  );

  void getUserAddress() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    userLatitude = position.latitude;
    userLongitude = position.longitude;

    List<Placemark> placemarks =
        await placemarkFromCoordinates(userLatitude, userLongitude);

    print("Lat-Long User : $userLatitude, $userLongitude");

    Placemark userAddresses = placemarks[0];
    setState(() {
      userAddress1 = userAddresses.subLocality.toString();
      userAddress2 = userAddresses.street.toString();
      _goToUser();
    });
    print("Lokasi User : ${userAddresses.street}");
  }

  Future<void> _goToUser() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(userLatitude, userLongitude), zoom: 17)));
  }

  @override
  void initState() {
    // TODO: implement initState
    getUserAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: deviceWidth,
          height: deviceHeight,
          child: Column(
            children: [
              SizedBox(height: 30),
              // top-nav
              Container(
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
                      'Pesanan Anda',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                  ],
                ),
              ),

              // mapview
              Expanded(
                child: Container(
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
              ),

              Container(
                width: deviceWidth,
                height: 160,
                padding: EdgeInsets.all(18),
                margin: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 0,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mitra sedang bersiap',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Mitra bentar lagi pergi ke tempatmu',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            Get.to(() => ConfirmPaymentPage());
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: MyStyle.primaryColor(),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Nama Mitra',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.chat,
                              color: MyStyle.primaryColor(),
                            )),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
