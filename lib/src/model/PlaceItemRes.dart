import 'dart:convert';

class PlaceItemRes {
  String name;
  String address;
  double lat;
  double lng;
  PlaceItemRes(this.name, this.address, this.lat, this.lng);
  static List<PlaceItemRes> fromJSon(Map<String, dynamic> json) {
    List<PlaceItemRes> pir = new List();
    var results = json['resutls'] as List;
    for (var item in results) {
      var p = new PlaceItemRes(item['name'], item['formatted_address'],
          item['geometry']['location']['lat'], item['geometry']['location']['lng']);
      pir.add(p);
    }
    return pir;
  }
}
