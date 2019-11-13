import 'dart:ui';

import 'package:flutter/cupertino.dart';

class FontSize {
  const FontSize();

  static const double larger = 25.0;
  static const double medium = 16.0;
  static const double small = 15.0;

}

class FontFamily{
  const FontFamily();

  static const String WorkSansSemiBold = "WorkSansSemiBold";
  static const String WorkSansMedium = "WorkSansMedium";

}

class Colors {
  const Colors();

  static const Color loginGradientStart = const Color(0xFFF44336);
  static const Color loginGradientEnd = const Color(0xDD000000);

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
