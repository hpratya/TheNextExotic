// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:thenextexoticeflutter/models/user_model.dart';
import 'package:thenextexoticeflutter/utillit/my_constant.dart';
import 'package:thenextexoticeflutter/utillit/my_dialog.dart';
import 'package:thenextexoticeflutter/widget/show_image.dart';
import 'package:thenextexoticeflutter/widget/show_title.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool statusRedEye = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                buildImage(size),
                buildAppName(),
                buildUser(size),
                buildPassword(size),
                buildLogin(size),
                buildCreateAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildCreateAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            margin: EdgeInsets.only(top: 50),
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/createAccount'),
              child: Text('Create new account'),
              style: TextButton.styleFrom(primary: MyConstant.darkColor),
            )),
      ],
    );
  }

  Row buildLogin(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            width: size * 0.6,
            child: ElevatedButton(
                style: MyConstant().myButtonStyle(),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    String email = userEmailController.text;
                    String password = passwordController.text;
                    print('User Email => $email, Password => $password');
                    checkAuthen(email: email, password: password);
                  }
                },
                child: Text('Login'))),
      ],
    );
  }

  Future<Null> checkAuthen({String? email, String? password}) async {
    String apiCheckAuthen =
        '${MyConstant.domain}/thenextexotic/getUserWhereUser.php?isAdd=true&email=$email';
    await Dio().get(apiCheckAuthen).then((value) {
      print('value from api = ==>$value');
      if (value.toString() == 'null') {
        MyDialog()
            .nomalDialog(context, 'Invalid Email', 'Please use correct Email');
      } else {
        for (var item in json.decode(value.data)) {
          Usermodel usermodel = Usermodel.fromMap(item);
          if (password == usermodel.password) {
            //Success
            String type = usermodel.userType;
            print('Authen success your user type ==> $type');
            switch (type) {
              case 'seller':
                Navigator.pushNamedAndRemoveUntil(
                    context, MyConstant.routSeller, (route) => false);
                break;
              case 'buyer':
                Navigator.pushNamedAndRemoveUntil(
                    context, MyConstant.routBuyer, (route) => false);
                break;
              default:
            }
          } else {
            //fail
            MyDialog().nomalDialog(
                context, 'Incorrect password', 'Please check your password');
          }
        }
      }
    });
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.8,
          child: TextFormField(
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please fill password';
              } else {
                return null;
              }
            },
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

  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.8,
          child: TextFormField(
            controller: userEmailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please fill email address';
              } else {
                return null;
              }
            },
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

  Row buildAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(title: MyConstant.appName, textStyle: MyConstant().h1Style()),
      ],
    );
  }

  Row buildImage(double size) {
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
