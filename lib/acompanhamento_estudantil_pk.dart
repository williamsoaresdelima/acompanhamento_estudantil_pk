library acompanhamento_estudantil_pk;
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'models/Adress.dart';
/// A Calculator.
class Location {
  Future<String> getLocation(double? lat, double? long) async {
  final _key = "AIzaSyBaSib038pliNynRUQ8oPCbEF_6D_Bs5vs";
  final _urlGoogle = "https://maps.googleapis.com/maps/api/geocode/json?";

    try {
        final uri = Uri.parse("${_urlGoogle}latlng=${lat},${long}&key=${_key}");
        Response response = await http.get(uri);
        Map<String, dynamic> json = jsonDecode(response.body);
        
      Address modelAdress = Address("", "", "", "", "", "");
      modelAdress.createAdress(json);

      return "${modelAdress.street}, ${modelAdress.district}, ${modelAdress.city} - ${modelAdress.uf}, ${modelAdress.postalCode} - ${modelAdress.country}";
    } catch (err) {
      print(err);
    }

    return "${lat} - ${long}";
  }
}
