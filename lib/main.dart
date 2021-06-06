import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/login/login.dart';

String userLogin;
void getUser() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  if (preferences.getString("token") == null) {
    userLogin = preferences.getString("token");
  } else {
    userLogin = null;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getUser();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF2661FA),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}
