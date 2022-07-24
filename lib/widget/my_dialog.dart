
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widget/show_image.dart';
import 'package:shoppingmall/widget/show_title.dart';

class MyDialog {
  Future<Null> alertLocationService(context) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: ShowImage(path: MyConstant.image4),
          title: ShowTitle(
            title: 'Location Service ปิดอยู่',
            textStyle: MyConstant().h2Style,
          ),
          subtitle: ShowTitle(
            title: 'กรุณาเปิด Location Service ด้วยครับ',
            textStyle: MyConstant().h3Style,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              // Navigator.pop(context);
              await Geolocator.openLocationSettings();
              exit(0);
            },
            child: Text('Ok'),
          ),
        ],
      ),
    );
  }
}
