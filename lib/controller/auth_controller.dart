import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:venvice/utils/my_style.dart';
import 'package:venvice/view/auth/auth-email-page.dart';
import 'package:venvice/view/auth/choose-auth-page.dart';
import 'package:venvice/view/main_menu_page.dart';

class AuthController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController noHpController = TextEditingController();

  Future<void> startAuth(String email, String password) async {
    Uri url = Uri.parse('http://192.168.1.2:4000/costumer/login');
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'email': '$email',
      'password': '$password',
    });
    print("INFO : try to login : $email / $password");
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    Map<String, dynamic> responseBody = json.decode(response.body);
    if (responseBody["success"] == true) {
      String userToken = responseBody["token"];
      print("INFO : Data user Exist, saving token ${responseBody["token"]}");
      print(userToken);

      final box = GetStorage();
      box.write('userToken', userToken);

      Get.offAll(() => MainMenuPage());
    } else {
      print("INFO : Data user Dont Exist");
      Get.defaultDialog(
          title: "Alert",
          backgroundColor: Colors.white,
          textCancel: "Coba lagi",
          cancelTextColor: MyStyle.primaryColor(),
          buttonColor: MyStyle.primaryColor(),
          barrierDismissible: false,
          radius: 12,
          content: Container(
            child: Text(
              'Auth login gagal\n username atau password salah',
              textAlign: TextAlign.center,
            ),
          ));
    }
  }

  Future<void> startReg(
      {required String name,
      required String email,
      required String password,
      required String noHp}) async {
    Uri url = Uri.parse('http://192.168.1.2:4000/costumer');
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'nama': '$name',
      'email': '$email',
      'password': '$password',
      'no_hp': '$noHp',
    });
    print("INFO : try to register : $email / $password");
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    Map<String, dynamic> responseBody = json.decode(response.body);
    if (responseBody["success"] == true) {
      print("INFO : Data user created");

      Get.off(() => ChooseAuthPage());
    } else {
      print("INFO : Data user fail created");
      Get.defaultDialog(
          title: "Alert",
          backgroundColor: Colors.white,
          textCancel: "Coba lagi",
          cancelTextColor: MyStyle.primaryColor(),
          buttonColor: MyStyle.primaryColor(),
          barrierDismissible: false,
          radius: 12,
          content: Container(
            child: Text(
              'Auth register gagal\n ${responseBody["message"]}',
              textAlign: TextAlign.center,
            ),
          ));
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
