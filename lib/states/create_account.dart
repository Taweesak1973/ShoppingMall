import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widget/my_dialog.dart';
import 'package:shoppingmall/widget/show_image.dart';
import 'package:shoppingmall/widget/show_title.dart';
import 'package:image_picker/image_picker.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String? typeUser;
  File? file;
  @override
  void initState() {
    checkPermission();
    super.initState();
  }

  Future<Null> checkPermission() async {
    bool locationService;
    LocationPermission locationPermission;
    locationService = await Geolocator.isLocationServiceEnabled();
    if (locationService) {
      print('Service Location Open');
      locationPermission = await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();
        if (locationPermission == LocationPermission.deniedForever) {
          MyDialog().alertLocationService(context);
        } else {
         // Find LatLng
        }
      } else {
        if (locationPermission == LocationPermission.deniedForever) {
          MyDialog().alertLocationService(context);
        } else {
          //Find Latlng
        }
      }
    } else {
      print('Service Location Close');

      MyDialog().alertLocationService(context);
    }
  }

  Row buildName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: MyConstant().h3Style,
              labelText: 'Name :',
              prefixIcon: Icon(
                Icons.fingerprint,
                color: MyConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPhone(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: MyConstant().h3Style,
              labelText: 'Phone :',
              prefixIcon: Icon(
                Icons.phone,
                color: MyConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: MyConstant().h3Style,
              labelText: 'User :',
              prefixIcon: Icon(
                Icons.person,
                color: MyConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: MyConstant().h3Style,
              labelText: 'Password :',
              prefixIcon: Icon(
                Icons.lock_outline,
                color: MyConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildAddress(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment(1, -1),
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            maxLines: 4,
            decoration: InputDecoration(
              hintStyle: MyConstant().h3Style,
              hintText: 'Address :',
              prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Icon(
                  Icons.home,
                  color: MyConstant.dark,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Account'),
        backgroundColor: MyConstant.primary,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: ListView(
            children: [
              buildTitle('ข้อมูลทั่วไป'),
              buildName(size),
              buildTitle('ชนิดของ User :'),
              buildRadioBuyer(size),
              buildRadioSeller(size),
              buildRadioRider(size),
              buildTitle('ข้อมูลพื้นฐาน'),
              buildAddress(size),
              buildPhone(size),
              buildUser(size),
              buildPassword(size),
              buildTitle('รูปภาพ :'),
              buildSubtitle(),
              buildAvatar(size),
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> chooseImage(ImageSource source) async {
    try {
      var result = await ImagePicker()
          .getImage(source: source, maxWidth: 800, maxHeight: 800);
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {
      print(e);
    }
  }

  Row buildAvatar(double size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            chooseImage(ImageSource.camera);
          },
          icon: Icon(
            Icons.add_a_photo,
            size: 36,
            color: MyConstant.dark,
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            width: size * 0.5,
            child: file == null
                ? Image.asset(
                    MyConstant.avatar,
                    color: MyConstant.dark,
                  )
                : Image.file(file!)),
        IconButton(
          onPressed: () {
            chooseImage(ImageSource.gallery);
          },
          icon: Icon(
            Icons.add_photo_alternate,
            color: MyConstant.dark,
            size: 36,
          ),
        ),
      ],
    );
  }

  ShowTitle buildSubtitle() {
    return ShowTitle(
        title: 'เป็นรูปภาพ ที่แสดงความเป็นตัวตนของ User'
            ' (แต่ถ้าไม่สดวกแชร์ เราจะแสดงภาพ defalse แทน',
        textStyle: MyConstant().h3Style);
  }

  buildRadioBuyer(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * .6,
          child: RadioListTile(
            value: 'buyer',
            groupValue: typeUser,
            onChanged: ((value) {
              setState(() {
                typeUser = value as String?;
              });
            }),
            title: ShowTitle(
              title: 'ผู้ซื้อ (Buyer)',
              textStyle: MyConstant().h3Style,
            ),
          ),
        ),
      ],
    );
  }

  Row buildRadioSeller(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * .6,
          child: RadioListTile(
            value: 'seller',
            groupValue: typeUser,
            onChanged: ((value) {
              setState(() {
                typeUser = value as String?;
              });
            }),
            title: ShowTitle(
              title: 'ผู้ขาย (Seller)',
              textStyle: MyConstant().h3Style,
            ),
          ),
        ),
      ],
    );
  }

  Row buildRadioRider(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * .6,
          child: RadioListTile(
            value: 'rider',
            groupValue: typeUser,
            onChanged: ((value) {
              setState(() {
                typeUser = value as String?;
              });
            }),
            title: ShowTitle(
              title: 'ผู้ส่ง (Rider)',
              textStyle: MyConstant().h3Style,
            ),
          ),
        ),
      ],
    );
  }

  Container buildTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ShowTitle(
        title: title,
        textStyle: MyConstant().h2Style,
      ),
    );
  }
}
