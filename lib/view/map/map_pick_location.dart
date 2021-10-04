import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:venvice/view/widgets/venvice-button.dart';

class MapPickLocation extends StatefulWidget {
  const MapPickLocation({Key? key}) : super(key: key);

  @override
  _MapPickLocationState createState() => _MapPickLocationState();
}

class _MapPickLocationState extends State<MapPickLocation> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

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
            SizedBox(height: 20),
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
              child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
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
                            Text(
                              'Blk. A No. 81',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 250,
                              child: Text(
                                'Blk. A No. 81, Gn. Kelua, Kec. Samarinda Ulu, Kota Samarinda, Kalimantan Timur',
                                maxLines: 2,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.bookmark_add_outlined))
                      ],
                    ),
                  ),
                  Spacer(),
                  VenvicePrimaryBtn('Konfirmasi', onTap: () {}),
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
