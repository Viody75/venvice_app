import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:venvice/view/map/map_pick_location.dart';
import 'package:venvice/view/order/order_page.dart';
import 'package:venvice/view/widgets/outlined_button.dart';

class MapListLocation extends StatefulWidget {
  const MapListLocation({Key? key}) : super(key: key);

  @override
  _MapListLocationState createState() => _MapListLocationState();
}

class _MapListLocationState extends State<MapListLocation> {
  var argsData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    double bottomContainerHeight = 220;
    return Scaffold(
      body: Container(
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
                      Get.back(result: ["$argsData"]);
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

            //
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: OutlinedBtn('Pilih Lewat Peta', onTap: () {
                Get.to(() => MapPickLocation());
              }, radius: 18, dWidth: 110, dHeight: 26),
            ),

            // lokasi saat ini
            Container(
              height: 100,
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                children: [
                  Icon(Icons.near_me),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Text(
                        'Lokasi kamu saat ini',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 250,
                        child: Text(
                          argsData[0] != null
                              ? '${argsData[0]}'
                              : 'Anda belum memiliki lokasi, silahkan pilih lewat Peta',
                          maxLines: 2,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
