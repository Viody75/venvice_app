import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venvice/utils/my_style.dart';
import 'package:venvice/view/order/order/rating_order_page.dart';
import 'package:venvice/view/order/payment/detail_transaction_page.dart';
import 'package:venvice/view/widgets/outlined_button.dart';
import 'package:venvice/view/widgets/venvice-button.dart';

class ConfirmPaymentPage extends StatefulWidget {
  const ConfirmPaymentPage({Key? key}) : super(key: key);

  @override
  _ConfirmPaymentPageState createState() => _ConfirmPaymentPageState();
}

class _ConfirmPaymentPageState extends State<ConfirmPaymentPage> {
  // var
  bool isProofExist = false;

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
                      'Konfirmasi Pembayaran',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                  ],
                ),
              ),

              // payment method
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: MyStyle.primaryColor()),
                      child: Center(
                        child: Text(
                          'Tunai',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      "Tunai",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              // detail
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    Text(
                      "Rp5.231.000",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    OutlinedBtn('Copy', onTap: () {
                      Get.back();
                    }, radius: 18, dWidth: 56, dHeight: 26),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    Text(
                      "ID TRANSAKSI",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "VEN123123",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    Text(
                      "DETAIL TRANSAKSI",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    OutlinedBtn('Lihat', onTap: () {
                      Get.to(() => DetailTransactionPage());
                    }, radius: 18, dWidth: 56, dHeight: 26),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        print('file tapped');
                        if (isProofExist == false) {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result != null) {
                            PlatformFile file = result.files.first;
                            setState(() {
                              isProofExist = true;
                            });
                          } else {
                            // User canceled the picker
                          }
                        }
                      },
                      child: isProofExist == false
                          ? DottedBorder(
                              strokeWidth: 2,
                              color: Colors.grey,
                              borderType: BorderType.RRect,
                              radius: Radius.circular(12),
                              padding: EdgeInsets.all(6),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                child: Container(
                                  height: 56,
                                  width: 56,
                                  child: Icon(Icons.insert_drive_file_outlined),
                                ),
                              ),
                            )
                          : Container(
                              height: 56,
                              width: 56,
                              child: Icon(
                                Icons.check_circle_outline,
                                color: Colors.green,
                              ),
                            ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Bukti Pembayaran",
                      style: TextStyle(fontSize: 14),
                    ),
                    Spacer(),
                    OutlinedBtn('Pilih file', onTap: () async {
                      print('file tapped');
                      if (isProofExist == false) {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();
                        if (result != null) {
                          PlatformFile file = result.files.first;
                          setState(() {
                            isProofExist = true;
                          });
                        } else {
                          // User canceled the picker
                        }
                      }
                    }, radius: 18, dWidth: 76, dHeight: 26),
                  ],
                ),
              ),

              // btn kirim bukti
              Spacer(),
              Container(
                  margin: EdgeInsets.only(left: 18, bottom: 18, right: 18),
                  child: VenvicePrimaryBtn("Kirim bukti pembayaran", onTap: () {
                    Get.to(() => RatingOrderPage());
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
