import 'package:flutter/material.dart';

class MyConstant {
//General
  static String appName = 'Shopping Mall';

  // Route
  static String routeAuthen = '/authen';
  static String routeCreateAccount = '/creaetAccount';
  static String routeBuyerService = '/buyerService';
  static String routeSaleService = '/salerService';
  static String routeRiderService = '/rederService';

  //Image
  static String image1 = 'images/image1.png';
  static String image2 = 'images/image2.png';
  static String image3 = 'images/image3.png';
  static String image4 = 'images/image4.png';
  static String image5 = 'images/image5.png';

  //Color
  static Color primary = Color(0xff304ffe);
  static Color dark = Color(0xff1a237e);
  static Color light = Color(0xff9fa8da);

  //Style
  TextStyle h1Style =
      TextStyle(fontSize: 24, color: dark, fontWeight: FontWeight.bold);
  TextStyle h2Style =
      TextStyle(fontSize: 18, color: dark, fontWeight: FontWeight.w700);
  TextStyle h3Style =
      TextStyle(fontSize: 14, color: dark, fontWeight: FontWeight.normal);

  ButtonStyle myButtonStyle() { return
    ElevatedButton.styleFrom(
      primary: MyConstant.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
