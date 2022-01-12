// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:thenextexoticeflutter/utillit/my_constant.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: MyConstant.darkColor,centerTitle: true,title: Text("Create new account"),),);
  }
}
