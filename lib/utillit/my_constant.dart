import 'package:flutter/material.dart';

class MyConstant {
  //General
  static String appName = 'The NextExotic';

  //Route
  static String routAuthen = '/authen';
  static String routCreateAccount = '/createAccount';
  static String routBuyer = '/buyerService';
  static String routSeller = '/sellerService';

  //Image
  static String imageLogo = 'images/logoRBG.png';

  //Colors
  static Color primaryColor = Color(0xfffbc02d);
  static Color darkColor = Color(0xffc49000);
  static Color lightColor = Color(0xfffff263);

  //Style
  TextStyle h1Style() => TextStyle(
        fontSize: 24,
        color: darkColor,
        fontWeight: FontWeight.bold,
      );
  TextStyle h2Style() => TextStyle(
        fontSize: 16,
        color: lightColor,
        fontWeight: FontWeight.w700,
      );
  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: primaryColor,
        fontWeight: FontWeight.normal,
      );
}
