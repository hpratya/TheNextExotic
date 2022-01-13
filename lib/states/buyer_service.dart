// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:thenextexoticeflutter/utillit/my_constant.dart';

class BuyerServive extends StatefulWidget {
  const BuyerServive({Key? key}) : super(key: key);

  @override
  _BuyerServiveState createState() => _BuyerServiveState();
}

class _BuyerServiveState extends State<BuyerServive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buyer Service'),
        backgroundColor: MyConstant.darkColor,
        centerTitle: true,
      ),
    );
  }
}
