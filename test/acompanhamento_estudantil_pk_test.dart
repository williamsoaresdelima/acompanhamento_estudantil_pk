import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:acompanhamento_estudantil_pk/acompanhamento_estudantil_pk.dart';
import 'package:indexed/indexed.dart';

void main() {
  test('test LocationAdress', () async {
    final locationAdress = LocationAdress();
      var test1= 'Rua XV de Novembro, Centro, Sorocaba - São Paulo, 18010-080 - Brazil';
      var test2= 'Avenida Brasil, Vila Carvalho, Sorocaba - São Paulo, 18060-105 - Brazil';
      var test3= 'Avenida São Paulo, Jardim Bela Vista, Sorocaba - São Paulo, 18013-004 - Brazil';

    expect(await locationAdress.getLocation(-23.4999813637141, -47.456532220222044), test1);
    expect(await locationAdress.getLocation(-23.485659713074647, -47.47121048088203), test2);
    expect(await locationAdress.getLocation(-23.488241322139356, -47.429060448286826), test3);
  });

  
  test('test createInputsDecorationText', () async {
      
      var test1 = InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      filled: true,
      hintStyle: TextStyle(color: Colors.grey[800]),
      hintText: 'test1',
      fillColor: Colors.white70,
    );

     var test2 = InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      filled: true,
      hintStyle: TextStyle(color: Colors.grey[800]),
      hintText: 'test2',
      fillColor: Colors.white70,
    );

    expect(InputsDecoration.createInputsDecorationText('test1'), test1);
    expect(InputsDecoration.createInputsDecorationText('test2'), test2);
  });

   test('test  createVisibilityPassword', () async {
      
      bool _visibilityEyeTest1 = false;
      bool _visibilityEyeTest2 = true;
      void releasePassword() {

      }

      var test1 = Indexed(
      index: 100,
      child: Positioned(
          width: 21,
          height: 21,
          right: 12,
          top: 12,
          child: IconButton(
              onPressed: releasePassword,
              icon: _visibilityEyeTest1
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off))),
    );
    
    expect(InputsDecoration.createVisibilityPassword(_visibilityEyeTest1, 
    releasePassword, 12, 12, 21, 21), test1);
  });
}
