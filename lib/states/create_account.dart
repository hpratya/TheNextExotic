// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thenextexoticeflutter/utillit/my_constant.dart';
import 'package:thenextexoticeflutter/utillit/my_dialog.dart';
import 'package:thenextexoticeflutter/widget/show_image.dart';
import 'package:thenextexoticeflutter/widget/show_progress.dart';
import 'package:thenextexoticeflutter/widget/show_title.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  File? file;
  String? userType;
  bool statusRedEye = true;
  double? lat, lng;
  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkPerms();
  }

  Future<Null> checkPerms() async {
    bool locationService;
    LocationPermission locationPermission;

    locationService = await Geolocator.isLocationServiceEnabled();
    if (locationService) {
      print('Service Location is open');

      locationPermission = await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();
        if (locationPermission == LocationPermission.deniedForever) {
          MyDialog().alertLocationService(
              context, 'ไม่อนุญาตแชร์ Location', 'โปรดแชร์ Location ของคุณ');
        } else {
          findLatLng();
        }
      } else {
        if (locationPermission == LocationPermission.deniedForever) {
          MyDialog().alertLocationService(
              context, 'ไม่อนุญาตแชร์ Location', 'โปรดแชร์ Location ของคุณ');
        } else {
          findLatLng();
        }
      }
    } else {
      print('Service Location Close');
      MyDialog().alertLocationService(
          context, 'Location ปิดอยู่ ?', 'กรุณาเปิด Location');
    }
  }

  Future<Null> findLatLng() async {
    print('Find Lat Lng is Working');
    Position? position = await findPosition();
    setState(() {
      lat = position!.latitude;
      lng = position.longitude;
      print('la = $lat, lng = $lng');
    });
  }

  Future<Position?> findPosition() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition();
      return position;
    } catch (e) {
      return null;
    }
  }

  Row buildName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          height: size * 0.1,
          child: TextFormField(
            controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกข้อมูล ชื่อ ให้ครบถ้วน';
              } else {}
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: size * 0.1),
              prefixIcon: Icon(
                Icons.account_circle_outlined,
                color: MyConstant.darkColor,
              ),
              hintText: 'name',
              hintStyle: TextStyle(color: MyConstant.darkColor, fontSize: 12),
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

  Row buildEmail(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          height: size * 0.1,
          child: TextFormField(
            controller: emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกข้อมูล อีเมลล์ ให้ครบถ้วน';
              } else {}
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: size * 0.1),
              prefixIcon: Icon(
                Icons.email_outlined,
                color: MyConstant.darkColor,
              ),
              hintText: 'email',
              hintStyle: TextStyle(color: MyConstant.darkColor, fontSize: 12),
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

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          height: size * 0.1,
          child: TextFormField(
            controller: passController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกข้อมูล รหัสผ่าน ให้ครบถ้วน';
              } else {}
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
              hintText: 'password',
              hintStyle: TextStyle(color: MyConstant.darkColor, fontSize: 12),
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

  Row buildAddress(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          height: size * 0.1,
          child: TextFormField(
            controller: addressController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกข้อมูล ที่อยู่ ให้ครบถ้วน';
              } else {}
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: size * 0.1),
              prefixIcon: Icon(
                Icons.house_outlined,
                color: MyConstant.darkColor,
              ),
              hintText: 'address',
              hintStyle: TextStyle(color: MyConstant.darkColor, fontSize: 12),
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

  Row buildContract(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          height: size * 0.1,
          child: TextFormField(
            controller: contactController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกข้อมูล ช่องทางการติดต่อ ให้ครบถ้วน';
              } else {}
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: size * 0.1),
              prefixIcon: Icon(
                Icons.contact_mail_outlined,
                color: MyConstant.darkColor,
              ),
              hintText: 'contact',
              hintStyle: TextStyle(color: MyConstant.darkColor, fontSize: 12),
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

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        actions: [
          buildCreateNewAccount(),
        ],
        backgroundColor: MyConstant.darkColor,
        centerTitle: true,
        title: Text("Create new account"),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildTitle('ประเภทของบัญชี'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildBuyer(size),
                    buildSeller(size),
                  ],
                ),
                buildTitle('ข้อมูลทั่วไป'),
                buildName(size),
                buildEmail(size),
                buildPassword(size),
                buildAddress(size),
                buildContract(size),
                buildTitle('รูปภาพ'),
                buildAvatar(size),
                buildTitle('แสดงพิกัดที่เครื่องอยู่'),
                buildMap(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: ElevatedButton(
                          style: MyConstant().myButtonStyle(),
                          onPressed: () {
                            setState(() {});
                          },
                          child: Text('confirm')),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconButton buildCreateNewAccount() {
    return IconButton(
      onPressed: () {
        if (formkey.currentState!.validate()) {
          if (userType == null) {
            print('Non type user');
            MyDialog().nomalDialog(context, 'ยังไม่ได้เลือกประเภทบัญชี',
                'กรุณาแตะที่ประเภทบัญชีที่ต้องการ');
          } else {
            print('Loading Database');
            uploadPicandInsertData();
          }
        }
      },
      icon: Icon(Icons.cloud_circle_outlined),
    );
  }

  Future<Null> uploadPicandInsertData() async {
    String name = nameController.text;
    String email = emailController.text;
    String pass = passController.text;
    String address = addressController.text;
    String contact = contactController.text;

    print(
        'name = $name, email = $email, pass = $pass, address = $address, contact = $contact');
    String path =
        '${MyConstant.domain}/thenextexotic/getUserWhereUser.php?isAdd=true&name=$name';
    await Dio().get(path).then((value) => print('## value => $value'));
  }

  // ignore: prefer_collection_literals
  Set<Marker> setMarker() => <Marker>[
        Marker(
          markerId: MarkerId('id'),
          position: LatLng(lat!, lng!),
          infoWindow: InfoWindow(
              title: 'ตำแหน่งของคุณ', snippet: 'Lat = $lat, Lng = $lng'),
        ),
      ].toSet();

  Widget buildMap() => Container(
        color: Colors.blueGrey[100],
        width: double.infinity,
        height: 300,
        child: lat == null
            ? ShowProgress()
            : GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: LatLng(lat!, lng!), zoom: 16),
                onMapCreated: (controller) {},
                markers: setMarker(),
              ),
      );

  Future<Null> chooseImage(ImageSource source) async {
    try {
      var result = await ImagePicker().pickImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {}
  }

  Row buildAvatar(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => chooseImage(ImageSource.camera),
          icon: Icon(Icons.add_a_photo_outlined),
          color: MyConstant.primaryColor,
        ),
        Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            width: size * 0.3,
            child: file == null
                ? ShowImage(path: MyConstant.avatarDefault)
                : Image.file(file!)),
        IconButton(
          onPressed: () => chooseImage(ImageSource.gallery),
          icon: Icon(Icons.add_photo_alternate),
          color: MyConstant.primaryColor,
        ),
      ],
    );
  }

  Row buildBuyer(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.4,
          height: size * 0.1,
          child: RadioListTile(
            value: 'buyer',
            groupValue: userType,
            onChanged: (value) {
              setState(() {
                userType = value as String?;
              });
            },
            title: ShowTitle(
              title: 'ผู้ซื้อ',
              textStyle: MyConstant().h4Style(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildSeller(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.4,
          height: size * 0.1,
          child: RadioListTile(
            value: 'seller',
            groupValue: userType,
            onChanged: (value) {
              setState(() {
                userType = value as String?;
              });
            },
            title: ShowTitle(
              title: 'ผู้ขาย',
              textStyle: MyConstant().h4Style(),
            ),
          ),
        ),
      ],
    );
  }

  Container buildTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: ShowTitle(
        title: title,
        textStyle: MyConstant().h4Style(),
      ),
    );
  }
}
