// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:thenextexoticeflutter/utillit/my_constant.dart';
import 'package:thenextexoticeflutter/widget/show_image.dart';
import 'package:thenextexoticeflutter/widget/show_title.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool statusRedEye = true;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            BuildImage(size),
            BuildAppName(),
            BuildUser(size),
            BuildPassword(size),
          ],
        ),
      ),
    );
  }

  Row BuildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.8,
          child: TextFormField(
            obscureText: statusRedEye,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: size * 0.1),
              prefixIcon: Icon(
                Icons.lock_outline,
                color: MyConstant.darkColor,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      statusRedEye = !statusRedEye;
                    });
                  },
                  icon: Icon(
                    statusRedEye
                        ? Icons.remove_red_eye_sharp
                        : Icons.remove_red_eye_outlined,
                    color: MyConstant.darkColor,
                  )),
              hintText: 'Password',
              hintStyle: TextStyle(color: MyConstant.darkColor),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyConstant.darkColor),
                  borderRadius: BorderRadius.circular(15)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyConstant.darkColor),
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
      ],
    );
  }

  Row BuildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.8,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: size * 0.1),
              prefixIcon: Icon(
                Icons.email_outlined,
                color: MyConstant.darkColor,
              ),
              hintText: 'Email Address',
              hintStyle: TextStyle(color: MyConstant.darkColor),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyConstant.darkColor),
                  borderRadius: BorderRadius.circular(15)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyConstant.darkColor),
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
      ],
    );
  }

  Row BuildAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(title: MyConstant.appName, textStyle: MyConstant().h1Style()),
      ],
    );
  }

  Row BuildImage(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: ShowImage(path: MyConstant.imageLogo),
        ),
      ],
    );
  }
}
