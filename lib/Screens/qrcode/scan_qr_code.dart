import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'dart:math';

class ScanQRCode extends StatefulWidget {
  ScanQRCode({Key key}) : super(key: key);

  @override
  _ScanQRCodeState createState() => _ScanQRCodeState();
}

class User {
  int month;
  int monthProduction;

  User(this.month, this.monthProduction);

  factory User.fromJson(dynamic json) {
    return new User(json['day'] as int, json['dayProduction'] as int);
  }
}

class _ScanQRCodeState extends State<ScanQRCode> {
  List<User> datass = [];
  int monthTotalProduction = 0;
  int yearTotalProduction = 0;
  String qrCode = 'Unknown data ';
  int data = 9;
  bool hasProduct;
  int productId;
  bool _isLoading = false;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  _getStats() async {
    Uri url = Uri.parse('http://192.168.1.46:3000/graphDay/1');
    http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    var q = json.decode(response.body) as List;
    for (int i = 0; i < q.length; i++) {
      datass.add(User.fromJson(q[i]));
      print(1 + q[i]['dayProduction']);

      monthTotalProduction += q[i]['dayProduction'];
    }
    //print(monthTotalProduction);
  }

  void getPrefs() async {
    final SharedPreferences prefs = await _prefs;
    hasProduct = prefs.getBool('hasProduct');
    print(hasProduct);

    if (hasProduct) {
      productId = prefs.getInt('productId');
      print(hasProduct);
    }
  }

  _getSeriesData() {
    List<charts.Series<User, int>> series = [
      charts.Series(
          id: "Sales",
          data: datass,
          areaColorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          domainFn: (User series, _) => series.month,
          measureFn: (User series, _) => series.monthProduction),
    ];
    return series;
  }

  void submit(context) async {
    final SharedPreferences prefs = await _prefs;
    final int counter = prefs.getInt('id');

    print("QR");
    print(counter);
    try {
      Uri url = Uri.parse('http://localhost:3000/signUp');

      Map<String, String> customHeaders = {
        "content-type": "application/json",
      };
      print(qrCode);
      http.Response response = await http.get(
        Uri.parse('http://localhost:3000/product/$qrCode/$counter'),
      );
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

  _firstTab() {
    return (Container(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 30),
        children: [
          SizedBox(
              width: double.infinity,
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Card(
                        elevation: 3,
                        color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.query_stats),
                                Text('Monthly Total Production'),
                              ],
                            ),
                            Text('$monthTotalProduction')
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Card(
                        elevation: 3,
                        color: Colors.grey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.query_stats),
                                Text('Yearly Total Production'),
                              ],
                            ),
                            Text('12132')
                          ],
                        )),
                  )
                ],
              )),
          SizedBox(
            width: double.infinity,
            height: 500,
            child: new charts.LineChart(
              _getSeriesData(),
              animate: false,
            ),
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    getPrefs();
    _getStats();
    print(monthTotalProduction);
    setState(() => monthTotalProduction = monthTotalProduction);

    print(hasProduct);
    if (true) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(text: 'Production Stats'),
                    Tab(text: 'Earning Stats'),
                    Tab(text: 'prodcut info'),
                  ],
                ),
                title: Text('Charts'),
              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: const <Widget>[
                    ListTile(
                      leading: Icon(Icons.message),
                      title: Text('Messages'),
                    ),
                    ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text('Profile'),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  _firstTab(),
                  Icon(Icons.directions_transit, size: 350),
                  Icon(Icons.directions_car, size: 350),
                ],
              ),
            ),
          ));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Scan QR Coder"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Result =  $data",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '---',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white60,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              RaisedButton(
                onPressed: () {
                  scanQrCode();
                },
                textColor: Colors.white,
                color: Colors.blue,
                padding: const EdgeInsets.all(10.0),
                child: const Text('  Start Scanning    ',
                    style: TextStyle(fontSize: 20)),
              )
            ],
          ),
        ),
      );
    }
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
