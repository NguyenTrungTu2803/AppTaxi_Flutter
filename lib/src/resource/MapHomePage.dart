import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ap/src/resource/widgets/HomeMenu.dart';
import 'package:flutter_ap/src/resource/widgets/RidePicker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapHomePage extends StatefulWidget {
  @override
  _MapHomePage createState() => _MapHomePage();
}

class _MapHomePage extends State<MapHomePage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Colors.white,
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: CameraPosition(
                // Search address
                target: LatLng(10.7915178, 106.7271422),
                zoom: 14.4746,
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: Column(
                  children: <Widget>[
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: Text(
                        "Taxi App",
                        style: TextStyle(color: Colors.black),
                      ),
                      leading: FlatButton(
                        onPressed: () {
                          print("Click menu");
                          //Scaffold.of(context).openDrawer(); //Run with this
                          _scaffoldKey.currentState.openDrawer();
                        },
                        child: Image.asset("assets/menu_map_black_24dp.png"),
                      ),
                      actions: <Widget>[
                        Image.asset("assets/ic_menu_notification_18dp.png",
                            width: 30, height: 30),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: RidePicker(),
                    )
                  ],
                ))
          ],
        ),
      ),
      drawer: Drawer(
        child: HomeMenu(),
      ),
    );
  }
}
