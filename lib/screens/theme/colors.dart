
import 'package:flutter/material.dart';

abstract class AppColors {
  static const black = Color(0xFF111111);
  static const white = Color(0xFFFAFAFA);

  static const white10 = Color(0x1AFAFAFA);
  static const white15 = Color(0x26FAFAFA);
  static const white40 = Color(0x66FAFAFA);

  static const orange = Color(0xFFF46C02);

  static const navBar = Color(0xFF9F5216);

  static const onboardingBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF9D4501),
      Color(0xFF111111),
    ],
  );

  static const background = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF111111),
      Color(0xFF9D4501),
    ],
  );

}