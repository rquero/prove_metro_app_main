import 'package:flutter/material.dart';

final Color initialColor = Colors.transparent;

class AppDecoration {

  static BoxDecoration roundedBorderRadius({
    Color? color,
    ShapeBorderRadius customShape = ShapeBorderRadius.BorderRadiusAll,
    String? image,
    ColorFilter? colorFilter,
    double radius = 0.0,
  }) => BoxDecoration(
    color: color ?? initialColor,
    image: image != null
      ? DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
          colorFilter: colorFilter,
        )
      : null,
    borderRadius: _buildBorderRadius(radius, customShape)
  );

  static BorderRadius _buildBorderRadius(
    double radius,
    ShapeBorderRadius customShape
  ) {
    switch(customShape) {
      case ShapeBorderRadius.BorderRadiusOnlyTop:
        return BorderRadius.only(
          topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius)
          );
      case ShapeBorderRadius.BorderRadiusAll:
        return BorderRadius.circular(radius);

    }
  }

}

enum ShapeBorderRadius { BorderRadiusOnlyTop, BorderRadiusAll }
