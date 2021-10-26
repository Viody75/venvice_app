import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venvice/view/activities/activities_page.dart';
import 'package:venvice/view/chat/list_chat_page.dart';
import 'package:venvice/view/notification/list_notif.dart';
import 'package:venvice/view/profile/profile_page.dart';
import 'beranda_page.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  @override
  _MainMenuPageState createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  final searchFocus = FocusNode();
  bool isSearchActive = false;

  @override
  void initState() {
    searchFocus.addListener(() {
      setState(() {
        isSearchActive = searchFocus.hasFocus;
      });
    });
    super.initState();
  }

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    BerandaPage(),
    ListChatPage(),
    ActivitiesPage(),
    ListNotificationPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: 'Obrolan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_rounded),
            label: 'Aktivitas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active_outlined),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Akun',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple[500],
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
