import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venvice/view/widgets/outlined_button.dart';

class JelajahPage extends StatelessWidget {
  const JelajahPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height - 24;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: deviceWidth,
          height: deviceHeight,
          child: Column(
            children: [
              Container(
                height: 60,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back_ios_rounded)),
                    SizedBox(width: 8),
                    Text(
                      'Jelejahi Venvice',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                width: deviceWidth,
                height: deviceHeight - 60,
                child: ListView(
                  children: [
                    // kesukaan
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 32, right: 32),
                      child: Row(
                        children: [
                          Text(
                            'Kesukaan',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          OutlinedBtn('Ubah', onTap: () {
                            Get.to(() => JelajahPage());
                          }, radius: 18, dWidth: 56, dHeight: 26)
                        ],
                      ),
                    ),

                    // item kesukaan
                    Container(
                      height: 200,
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 90,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 20),
                        itemCount: 8,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                              onTap: () {
                                print('item tapped');
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/workshop.png',
                                      width: 50,
                                      height: 50,
                                    ),
                                    Spacer(),
                                    Text(
                                      'Service \nMotor',
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ));
                        },
                      ),
                    ),

                    // kategori 1
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 32, right: 32),
                      child: Row(
                        children: [
                          Text(
                            'Kategori 1',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Spacer()
                        ],
                      ),
                    ),

                    // item kategori 1
                    Container(
                      height: 100,
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 90,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 20),
                        itemCount: 4,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                              onTap: () {
                                print('item tapped');
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/workshop.png',
                                      width: 50,
                                      height: 50,
                                    ),
                                    Spacer(),
                                    Text(
                                      'Item \nKategori 1',
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ));
                        },
                      ),
                    ),

                    // kategori 2
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 32, right: 32),
                      child: Row(
                        children: [
                          Text(
                            'Kategori 1',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Spacer()
                        ],
                      ),
                    ),

                    // item kategori 2
                    Container(
                      height: 100,
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 90,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 20),
                        itemCount: 4,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                              onTap: () {
                                print('item tapped');
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/workshop.png',
                                      width: 50,
                                      height: 50,
                                    ),
                                    Spacer(),
                                    Text(
                                      'Item \nKategori 2',
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
