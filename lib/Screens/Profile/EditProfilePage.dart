import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:qrcode_mongodb/Screens/charts/Charts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);
  bool showPassword = false;
  final TextEditingController email = TextEditingController();

  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    update(name, email, password) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int userId = prefs.getInt('id') ?? 0;
      Map<String, dynamic> user = {
        "email": email.text,
        "password": password.text,
        "name": name.text
      };
      var l = jsonEncode(user);

      http.Response response = await http.put(
        Uri.parse('http://192.168.43.60:3000/updateProfile/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: l,
      );
    }

    void vaildation() async {
      if (email.text.isEmpty && password.text.isEmpty && name.text.isEmpty) {
        update(name, email, password);
      } else if (email.text.isEmpty) {
        if (name.text.isEmpty) {
          if (password.text.length < 8) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Password  Is Too Short"),
              ),
            );
          } else {
            update(name, email, password);
          }
        } else {
          if (name.text.length < 8) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("name  Is Too Short"),
              ),
            );
          } else {
            update(name, email, password);
          }
        }
      } else {
        update(name, email, password);
      }
    }

    return Scaffold(
      backgroundColor: HexColor('#2f4d86'),
      appBar: AppBar(
        backgroundColor: HexColor('#2f4d86'),
        elevation: 4,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => Charts()));
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Full Name", "", false, name),
              buildTextField("E-mail", "", false, email),
              buildTextField("Password", "", true, password),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => Charts()));
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      vaildation();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Profile Edited Successfully"),
                          duration: Duration(milliseconds: 2000),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordTextField, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller: controller,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.white,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ),
    );
  }

  alert() {
    return Center(
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
                  // scanQrCode();
                  // submit(context);
                },
                textColor: Colors.white,
                color: Colors.blue,
                padding: const EdgeInsets.all(10.0),
                child: const Text('Scan Now ', style: TextStyle(fontSize: 20)),
              ))
            ],
          )
        ],
      ),
    );
  }
}
