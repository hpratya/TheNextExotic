import 'package:flutter/material.dart';

class MyConstant {
  //General
  static String appName = 'The Next Exotic';
  static String domain =
      'https://0d85-2001-fb1-14b-891c-696f-8f31-327c-9e1b.ngrok.io';

  //Route
  static String routAuthen = '/authen';
  static String routCreateAccount = '/createAccount';
  static String routBuyer = '/buyerService';
  static String routSeller = '/sellerService';

  //Image
  static String imageLogo = 'images/logoRBG.png';
  static String avatarDefault = 'images/accountIcon.png';

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
  // ignore: prefer_const_constructors
  TextStyle h4Style() => TextStyle(
        fontSize: 12,
        color: darkColor,
        fontWeight: FontWeight.w700,
      );

  //ButtonStyle
  ButtonStyle myButtonStyle() => ElevatedButton.styleFrom(
      primary: MyConstant.darkColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ));
}
