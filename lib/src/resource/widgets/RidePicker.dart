import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RidePicker extends StatefulWidget {
  _RidePicker createState() => _RidePicker();
}

class _RidePicker extends State<RidePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Color(0x8899999), offset: Offset(0, 5), blurRadius: 5.0)
          ]),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
              onPressed: () {},
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: <Widget>[
                    SizedBox(
                      width: 40,
                      height: 50,
                      child: Center(
                        child: Image.asset(
                          "assets/room_map_black_24dp.png",
                          width: 20,
                          height: 20,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                    Positioned(
                        right: 0,
                        width: 20,
                        height: 20,
                        child: Center(
                          child: Image.asset(
                            "assets/ic_remove_x_18dp.png",
                            color: Colors.teal,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 20),
                      child: Text(
                        "30 Lê Trọng Tấn, Phường Sơn Kỳ, Quận Tân Phú, HCM",
                        overflow: TextOverflow.ellipsis, // text 1 line
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff323643)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
              width: double.infinity,
              height: 50,
              child: FlatButton(
                  onPressed: () {},
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: <Widget>[
                        SizedBox(
                          width: 40,
                          height: 50,
                          child: Center(
                            child: Image.asset(
                              "assets/ic_map_nav_18dp.png",
                              width: 20,
                              height: 20,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                        Positioned(
                            right: 0,
                            child: Center(
                                child: Image.asset(
                              "assets/ic_remove_x_18dp.png",
                              width: 20,
                              height: 20,
                              color: Colors.teal,
                            ))),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 20),
                          child: Text(
                            "30 Lê Trọng Tấn, Phường Sơn Kỳ, Quận Tân Phú, HCM",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff323643)),
                          ),
                        ),
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}
