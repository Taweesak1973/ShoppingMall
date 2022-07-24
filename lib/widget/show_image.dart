import 'package:flutter/material.dart';
import 'package:shoppingmall/utility/my_constant.dart';
class ShowImage extends StatelessWidget {
  final String path;
  const ShowImage({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(path,);
  }
}
