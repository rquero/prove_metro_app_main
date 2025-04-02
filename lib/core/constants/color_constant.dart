import 'package:flutter/material.dart';

class ColorConstant {
  
  static Color black3D = fromHex('#3D3D3D');

  static Color black1D = fromHex("#1A1B1D");

  static Color black00 = fromHex('#000000');
    
  static Color whiteFF = fromHex('#FFFFFF');

  static Color whiteFC = fromHex('#FCFCFC');
  
  static Color gray3D  = fromHex('#3D3D3D');

  static Color transparent = fromHex('#00000000');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
