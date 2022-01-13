// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:thenextexoticeflutter/utillit/my_constant.dart';

class SellerService extends StatefulWidget {
  const SellerService({Key? key}) : super(key: key);

  @override
  _SellerServiceState createState() => _SellerServiceState();
}

class _SellerServiceState extends State<SellerService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seller Service'),
        backgroundColor: MyConstant.darkColor,
        centerTitle: true,
      ),
    );
  }
}
