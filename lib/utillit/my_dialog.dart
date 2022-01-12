import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:thenextexoticeflutter/utillit/my_constant.dart';
import 'package:thenextexoticeflutter/widget/show_image.dart';
import 'package:thenextexoticeflutter/widget/show_title.dart';

class MyDialog {
  Future<Null> alertLocationService(
      BuildContext context, String title, String message) async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: ListTile(
                leading: ShowImage(path: MyConstant.imageLogo),
                title:
                    ShowTitle(title: title, textStyle: MyConstant().h2Style()),
                subtitle: ShowTitle(
                    title: message, textStyle: MyConstant().h4Style()),
              ),
              actions: [
                TextButton(
                    onPressed: () async {
                      //Navigator.pop(context);
                      await Geolocator.openLocationSettings();
                      exit(0);
                    },
                    child: Text('OK'))
              ],
            ));
  }

  Future<Null> nomalDialog(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          leading: ShowImage(path: MyConstant.imageLogo),
          title: ShowTitle(title: title, textStyle: MyConstant().h3Style()),
          subtitle:
              ShowTitle(title: message, textStyle: MyConstant().h4Style()),
        ),
        children: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text('ตกลง')),
        ],
      ),
    );
  }
}
