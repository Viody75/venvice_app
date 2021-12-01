import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:venvice/utils/my_style.dart';
import 'package:venvice/view/map/map_list_location.dart';
import 'package:venvice/view/widgets/loading_item.dart';
import 'package:venvice/view/widgets/venvice-button.dart';

class MapPickLocation extends StatefulWidget {
  const MapPickLocation({Key? key}) : super(key: key);

  @override
  _MapPickLocationState createState() => _MapPickLocationState();
}

class _MapPickLocationState extends State<MapPickLocation> {
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

  @override
  void initState() {
    // TODO: implement initState
    getUserAddress();
    super.initState();
  }

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
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    double bottomContainerHeight = 220;
    return Scaffold(
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        child: Column(
          children: [
            SizedBox(height: 30),
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
                    'Pilih Alamat Pengerjaan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                ],
              ),
            ),

            // mapview
            Container(
              width: deviceWidth,
              height: deviceHeight - bottomContainerHeight - 90,
              child: Stack(
                children: [
                  Container(
                    width: deviceWidth,
                    height: deviceHeight - bottomContainerHeight - 90,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  ),
                  Container(
                    width: deviceWidth,
                    height: deviceHeight - bottomContainerHeight - 90,
                    child: Center(
                      child: Icon(
                        Icons.location_on,
                        size: 58,
                        color: MyStyle.primaryColor(),
                      ),
                    ),
                  )
                ],
              ),
            ),

            // bottom container
            Container(
              width: deviceWidth,
              height: bottomContainerHeight,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Spacer(),
                  Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Colors.deepPurple.shade50,
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(),
                            userAddress1 == ''
                                ? LoadingItem(width: 100, height: 14)
                                : Text(
                                    userAddress1,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                            SizedBox(height: 10),
                            Container(
                              width: 200,
                              child: userAddress2 == ''
                                  ? LoadingItem(width: 200, height: 14)
                                  : Text(
                                      userAddress2,
                                      maxLines: 2,
                                    ),
                            ),
                            Spacer(),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.pin_drop_rounded))
                      ],
                    ),
                  ),
                  Spacer(),
                  VenvicePrimaryBtn('Konfirmasi', onTap: () {
                    Get.back(result: ["$userAddress2"]);
                  }),
                  Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
