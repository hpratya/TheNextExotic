import 'package:flutter/material.dart';
import 'package:thenextexoticeflutter/states/authen.dart';
import 'package:thenextexoticeflutter/states/buyer_service.dart';
import 'package:thenextexoticeflutter/states/create_account.dart';
import 'package:thenextexoticeflutter/states/seller_service.dart';
import 'package:thenextexoticeflutter/utillit/my_constant.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => Authen(),
  '/createAccount': (BuildContext context) => CreateAccount(),
  '/buyerService': (BuildContext context) => BuyerServive(),
  '/sellerService': (BuildContext context) => SellerService()
};

String? initialRoute;

void main() {
  initialRoute = MyConstant.routAuthen;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyConstant.appName,
      routes: map,
      initialRoute: initialRoute,
    );
  }
}
