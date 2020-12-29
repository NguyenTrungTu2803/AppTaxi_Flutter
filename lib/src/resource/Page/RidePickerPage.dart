import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RidePickerPage extends StatefulWidget {
  @override
  _RidePickerPageState createState() => _RidePickerPageState();
}

class _RidePickerPageState extends State<RidePickerPage> {
  var _addressController;

  @override
  void initState() {
    super.initState();
    _addressController = TextEditingController(text: "");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                color: Colors.white,
                child: Container(
                  width: double.infinity,
                  height: 60,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      SizedBox(
                        width: 40,
                          height: 60,
                          child: Center(
                              child: Image.asset(
                            "assets/room_map_black_24dp.png",
                            color: Colors.teal,
                            width: 20,
                            height: 20,
                          ))),
                      Positioned(
                        height: 20,
                        right: 0,
                          child: Center(
                            child: FlatButton(
                              onPressed: () { _addressController.text = "";},
                              child: Image.asset(
                                "assets/ic_remove_x_18dp.png",
                                color: Colors.teal,
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 50,),
                        child: TextField(
                          controller: _addressController,
                          textInputAction: TextInputAction.search,
                          onSubmitted: (str){},
                          style: TextStyle(fontSize: 16, color: Color(0xff323643)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
