import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:qrcode_mongodb/Screens/Profile/EditProfilePage.dart';
import 'package:qrcode_mongodb/Screens/charts/Charts.dart';
import 'package:qrcode_mongodb/Screens/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScanQRCode extends StatefulWidget {
  ScanQRCode({Key key}) : super(key: key);

  @override
  _ScanQRCodeState createState() => _ScanQRCodeState();
}

class QrText {
  int qrCode;
  String name;
  QrText(this.qrCode, this.name);

  factory QrText.fromJson(dynamic json) {
    return QrText(json['qrCode'] as int, json['name'] as String);
  }
  @override
  String toString() {
    return '{ ${this.qrCode}, ${this.name} }';
  }
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String qrCode = 'Unknown data ';
  String qrName = 'Unknown data ';
  void submit(context) async {
    print("Yes");

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int userId = prefs.getInt('id') ?? 0;
      QrText qrr = QrText.fromJson(jsonDecode(qrCode));
      int code = qrr.qrCode;
      String name = qrr.name;

      Uri url = Uri.parse(
          'http://192.168.43.60:3000/AssignProduct/$code/$name/$userId');
      http.Response response = await http.post(
        url,
      );
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      prefs.setInt("productID", responseBody["data"]);
      print(responseBody['data']);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) => Charts()), (route) => false);
    } on PlatformException catch (error) {
      var message = "Please Check Your Internet Connection ";
      if (error.message != null) {
        message = error.message;
      }
      print(message.toString());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message.toString()),
          duration: Duration(milliseconds: 800),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    } catch (error) {
      print(error.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
        duration: Duration(milliseconds: 800),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: HexColor('#2f4d86')),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Scan QR Code"),
        ),
        drawer: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: HexColor(
                    "#2f4d86") //This will change the drawer background to blue.
                //other styles
                ),
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfilePage(),
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: ListTile(
                      leading: Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      ),
                      title:
                          Text('Logout', style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoAlertDialog(
                title: Text("You don't have any products yet"),
                content: Text("Scan QR code to continue"),
                actions: [
                  CupertinoDialogAction(
                      child: RaisedButton(
                    onPressed: () {
                      scanQrCode();
                      // submit(context);
                    },
                    textColor: Colors.white,
                    color: Colors.blue,
                    padding: const EdgeInsets.all(10.0),
                    child:
                        const Text('Scan Now ', style: TextStyle(fontSize: 20)),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> scanQrCode() async {
    try {
      qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      submit(context);
      if (!mounted) return;
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}
