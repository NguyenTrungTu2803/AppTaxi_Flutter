import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ap/src/resource/widgets/RidePicker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapHomePage extends StatefulWidget {
  @override
  _MapHomePage createState() => _MapHomePage();
}

class _MapHomePage extends State<MapHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(45.521563, -122.677433),
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
                      elevation: 0.0,
                      title: Text(
                        "Taxi App",
                        style: TextStyle(color: Colors.black),
                      ),
                      leading: FlatButton(
                        onPressed: () {
                          print("Click menu");
                        },
                        child: Image.asset("assets/menu_map_black_24dp.png"),
                      ),
                      actions: <Widget>[
                        Image.asset("assets/room_map_black_24dp.png", width: 30,height: 30),
                      ],
                    ),

                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
