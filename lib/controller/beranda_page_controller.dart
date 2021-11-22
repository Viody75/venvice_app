import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class BerandaPageController extends GetxController {
  late Position userPosition;
  late String userAddress;

  void onInit() async {
    // TODO: implement onInit
    getUserAddress();
    super.onInit();
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
}
