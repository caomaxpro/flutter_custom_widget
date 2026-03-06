import 'dart:math' as math;
import 'package:flutter/material.dart';

class Responsive {
  static const Size designSize = Size(412, 917);
  static Size _screen = designSize;

  static void init(BuildContext context) {
    _screen = MediaQuery.sizeOf(context);
  }

  static double scaleW(num v) => v * (_screen.width / designSize.width);
  static double scaleH(num v) => v * (_screen.height / designSize.height);
  static double scaleSp(num v) {
    final sw = _screen.width / designSize.width;
    final sh = _screen.height / designSize.height;
    return v * math.min(sw, sh);
  }
}

extension ResponsiveNum on num {
  double get w => Responsive.scaleW(this);
  double get h => Responsive.scaleH(this);
  double get sp => Responsive.scaleSp(this);
}
