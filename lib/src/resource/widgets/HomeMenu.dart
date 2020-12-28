import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: SizedBox(
                  child: Image.asset(
                    "assets/ic_name_black_20dp.png",
                    color: Color(0xff323643),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 70,
                child: Text(
                  "My profile",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff323643),
                  ),
                ),
              )
            ],
          ),
        ),
        ListTile(
          leading: Image.asset(
            "assets/ic_menu_history_18dp.png",
            color: Color(0xff323643),
          ),
          title: Text(
            "Ride history",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff323643),
            ),
          ),
        ),
        ListTile(
          leading: Image.asset(
            "assets/ic_menu_order_18dp.png",
            color: Color(0xff323643),
          ),
          title: Text(
            "Offers",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff323643),
            ),
          ),
        ),
        ListTile(
          leading: Image.asset(
            "assets/ic_menu_notification_18dp.png",
            color: Color(0xff323643),
          ),
          title: Text(
            "Notification",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff323643),
            ),
          ),
        ),
        ListTile(
          leading: Image.asset(
            "assets/ic_menu_help_18dp.png",
            color: Color(0xff323643),
          ),
          title: Text(
            "Help & Support",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff323643),
            ),
          ),
        ),
        ListTile(
          leading: Image.asset(
            "assets/ic_menu_logout_18dp.png",
            color: Color(0xff323643),
          ),
          title: Text(
            "Logout",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff323643),
            ),
          ),
        ),
      ],
    );
  }
}
