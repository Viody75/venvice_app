import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venvice/utils/my_style.dart';
import 'package:venvice/view/notification/detail_notif.dart';
import 'package:venvice/view/profile/edit_profile/edit_profile_page.dart';

import 'package:venvice/view/profile/profile_item_page.dart';
import 'package:venvice/view/profile/vencoin/vencoin_page.dart';

import 'coupon/coupon.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        Container(
          height: 60,
          color: MyStyle.primaryColor(),
          child: Row(
            children: [
              Spacer(),
              Text(
                'Profil',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Spacer(),
            ],
          ),
        ),

        // User data
        Container(
          height: 80,
          margin: EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image(
                    image: NetworkImage('https://via.placeholder.com/44'),
                    fit: BoxFit.fill,
                    width: 44,
                    height: 44,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Container(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Text('Ujang Kasep',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 4),
                    Text('+628123456789', style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 4),
                    Text('ujangkasep75@gmail.com',
                        style: TextStyle(color: Colors.grey)),
                    Spacer(),
                  ],
                ),
              ),
              Spacer(),
              Container(
                child: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Get.to(() => EditProfilePage());
                  },
                ),
              ),
            ],
          ),
        ),

        // List Options
        Container(
          width: deviceWidth,
          height: deviceHeight - 60,
          child: ListView(
            children: [
              // Akun
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                child: Text('Akun',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              ItemProfile(
                  iconData: Icons.confirmation_num,
                  itemName: 'Kupon Saya',
                  onTap: () {
                    print('item kupon tapped');
                    Get.to(() => CouponPage());
                  }),
              ItemProfile(
                  iconData: Icons.monetization_on_outlined,
                  itemName: 'VenCoin',
                  onTap: () {
                    print('item vencoin tapped');
                    Get.to(() => VencoinPage());
                  }),
              ItemProfile(
                  iconData: Icons.help,
                  itemName: 'Bantuan',
                  onTap: () {
                    print('item bantuan tapped');
                  }),

              // Info Lainnya
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                child: Text('Akun',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              ItemProfile(
                  iconData: Icons.library_books,
                  itemName: 'Syarat & Ketentuan',
                  onTap: () {
                    print('item sk tapped');
                  }),
              ItemProfile(
                  iconData: Icons.verified_user,
                  itemName: 'Kebijakan Privasi',
                  onTap: () {
                    print('item kebijakan privasi tapped');
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
