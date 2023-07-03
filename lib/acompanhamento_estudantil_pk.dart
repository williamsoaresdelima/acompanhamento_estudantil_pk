library acompanhamento_estudantil_pk;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:indexed/indexed.dart';

import 'models/Adress.dart';

class LocationAdress {
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

class InputsDecoration {
  static InputDecoration createInputsDecorationText(String text) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      filled: true,
      hintStyle: TextStyle(color: Colors.grey[800]),
      hintText: text,
      fillColor: Colors.white70,
    );
  }

  static Widget createVisibilityPassword(
      bool _visibilityEye, void releasePassword(), 
      double right, double top, double width, double height) {
    return Indexed(
      index: 100,
      child: Positioned(
          width: width,
          height: height,
          right: right,
          top: top,
          child: IconButton(
              onPressed: releasePassword,
              icon: _visibilityEye
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off))),
    );
  }
}
