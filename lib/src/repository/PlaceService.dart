import 'dart:async';
import 'dart:convert';
import 'package:flutter_ap/src/config/AppConfig.dart';
import 'package:flutter_ap/src/model/PlaceItemRes.dart';
import 'package:http/http.dart' as http;
import '';

class PlaceService {
  static Future<List<PlaceItemRes>> searchPlace(String keyword) async {
    String url = "http://maps.google.com/maps/api/plase/textsearch/json?key=" +
        AppConfig.ggKeyApi +
        "&language=vi&region=VN&query=+" +
        Uri.encodeQueryComponent(keyword);
    print("search=>"+ url);
    var res = await http.get(url);
    if(res.statusCode == 200){
      return PlaceItemRes.fromJSon(json.decode(res.body));
    }else{
      return new List();
    }
  }
}
