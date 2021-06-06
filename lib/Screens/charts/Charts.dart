import 'dart:convert';

import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:qrcode_mongodb/Screens/Profile/EditProfilePage.dart';
import 'package:qrcode_mongodb/Screens/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Charts extends StatefulWidget {
  Charts({Key key}) : super(key: key);

  @override
  _ChartsState createState() => _ChartsState();
}

class GraphGenDay {
  int month;
  int monthProduction;

  GraphGenDay(this.month, this.monthProduction);

  factory GraphGenDay.fromJson(dynamic json) {
    return new GraphGenDay(json['day'] as int, json['dayProduction'] as int);
  }
}

class GraphGenMonth {
  int month;
  int monthProduction;

  GraphGenMonth(this.month, this.monthProduction);

  factory GraphGenMonth.fromJson(dynamic json) {
    return new GraphGenMonth(
        json['month'] as int, json['monthProduction'] as int);
  }
}

class GraphGenYear {
  int month;
  int monthProduction;

  GraphGenYear(this.month, this.monthProduction);

  factory GraphGenYear.fromJson(dynamic json) {
    return new GraphGenYear(json['year'] as int, json['yearProduction'] as int);
  }
}

class GraphEarningDay {
  int month;
  int profit;

  GraphEarningDay(this.month, this.profit);

  factory GraphEarningDay.fromJson(dynamic json) {
    return new GraphEarningDay(json['day'] as int, json['profit'] as int);
  }
}

class GraphEarningMonth {
  int month;
  int profit;

  GraphEarningMonth(this.month, this.profit);

  factory GraphEarningMonth.fromJson(dynamic json) {
    return new GraphEarningMonth(json['month'] as int, json['win'] as int);
  }
}

class GraphEarningYear {
  int month;
  int profit;

  GraphEarningYear(this.month, this.profit);

  factory GraphEarningYear.fromJson(dynamic json) {
    return new GraphEarningYear(json['month'] as int, json['win'] as int);
  }
}

class _ChartsState extends State<Charts> {
  List<GraphGenDay> dataGenDay = [];
  List<GraphGenMonth> dataGenMonth = [];
  List<GraphGenYear> dataGenYear = [];
  List<GraphEarningDay> dataProfitDay = [];
  List<GraphEarningMonth> dataProfitMonth = [];
  List<GraphEarningYear> dataProfitYear = [];

  var axis = charts.NumericAxisSpec(
      renderSpec: charts.GridlineRendererSpec(
    labelStyle: charts.TextStyleSpec(
        fontSize: 10,
        color: charts.MaterialPalette
            .white), //chnage white color as per your requirement.
  ));
  int dailyTotalProduction = 0;
  var dailyTotalProfit;

  int monthTotalProduction = 0;
  var monthTotalProfit;

  int yearTotalProduction = 0;
  var yearTotalProfit;
  String qrCode = 'Unknown data ';
  int data = 9;
  bool hasProduct;
  int productId;

  var isSelected = [true, false, false];

  Future getDataGenDay() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int productId = prefs.getInt('productID') ?? 0;

    monthTotalProduction = 0;

    Uri url = Uri.parse('http://192.168.43.60:3000/graphDay/$productId');
    http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    dataGenDay.clear();

    var q = json.decode(response.body) as List;
    for (int i = 0; i < q.length; i++) {
      dataGenDay.add(GraphGenDay.fromJson(q[i]));
    }
    dailyTotalProduction = q[q.length - 1]['dayProduction'];
    dailyTotalProfit = dailyTotalProduction * 280 / 1000;

    return q;
  }

  Future getDataGenMonth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int productId = prefs.getInt('productID') ?? 0;
    monthTotalProduction = 0;

    Uri url = Uri.parse('http://192.168.43.60:3000/graphMonth/$productId');
    http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    dataGenMonth.clear();
    dataProfitDay.clear();

    var q = json.decode(response.body) as List;
    for (int i = 0; i < q.length; i++) {
      dataGenMonth.add(GraphGenMonth.fromJson(q[i]));
    }
    monthTotalProduction = q[q.length - 1]['monthProduction'];
    monthTotalProfit = monthTotalProduction * 280 / 1000;

    return q;
  }

  Future getDataGenYear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int productId = prefs.getInt('productID') ?? 0;
    monthTotalProduction = 0;

    Uri url = Uri.parse('http://192.168.43.60:3000/graphYear/$productId');
    http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    dataGenYear.clear();
    dataProfitYear.clear();

    var q = json.decode(response.body) as List;
    for (int i = 0; i < q.length; i++) {
      dataGenYear.add(GraphGenYear.fromJson(q[i]));
    }
    yearTotalProduction = q[q.length - 1]['yearProduction'];
    yearTotalProfit = yearTotalProduction * 280 / 1000;
    yearTotalProduction == 0
        ? yearTotalProfit = 0
        : yearTotalProfit = yearTotalProfit;
    return q;
  }

  _getgenData() {
    List<charts.Series<GraphGenDay, int>> series = [
      charts.Series(
          id: "Sales",
          data: dataGenDay,
          areaColorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          domainFn: (GraphGenDay series, _) => (series.month),
          measureFn: (GraphGenDay series, _) => series.monthProduction),
    ];
    return series;
  }

  _getgenMonth() {
    List<charts.Series<GraphGenMonth, int>> series = [
      charts.Series(
          id: "Sales",
          data: dataGenMonth,
          areaColorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          domainFn: (GraphGenMonth series, _) => (series.month),
          measureFn: (GraphGenMonth series, _) => series.monthProduction),
    ];
    return series;
  }

  _getgenYear() {
    List<charts.Series<GraphGenYear, int>> series = [
      charts.Series(
          id: "Sales",
          data: dataGenYear,
          areaColorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          domainFn: (GraphGenYear series, _) => (series.month),
          measureFn: (GraphGenYear series, _) => series.monthProduction),
    ];
    return series;
  }

  _firstTab() {
    if (isSelected[0] == true) {
      return (Container(
          child: Scaffold(
        body: FutureBuilder(
          future: getDataGenDay(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return (ListView(
                padding: EdgeInsets.symmetric(vertical: 15),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.query_stats),
                                        Text('Daily Total Production'),
                                      ],
                                    ),
                                    Text('$dailyTotalProduction')
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.attach_money),
                                        Text('Daily Total Profit'),
                                      ],
                                    ),
                                    Text(('$dailyTotalProfit'))
                                  ],
                                )),
                          )
                        ],
                      )),
                  Center(
                    child: Positioned(
                        top: 0,
                        right: 10,
                        child: ToggleButtons(
                          children: <Widget>[
                            Text('Day', style: TextStyle(color: Colors.white)),
                            Text('Month',
                                style: TextStyle(color: Colors.white)),
                            Text('Year', style: TextStyle(color: Colors.white)),
                          ],
                          onPressed: (int index) {
                            setState(() {
                              isSelected = [false, false, false];
                              isSelected[index] = !isSelected[index];
                            });
                          },
                          isSelected: isSelected,
                        )),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 500,
                    child: new charts.LineChart(
                      _getgenData(),
                      animate: true,
                    ),
                  ),
                ],
              ));
            }
            return CircularProgressIndicator();
          },
        ),
      )));
    } else if (isSelected[1] == true) {
      return (Container(
          child: Scaffold(
        body: FutureBuilder(
          future: getDataGenMonth(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return (ListView(
                padding: EdgeInsets.symmetric(vertical: 15),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.attach_money),
                                        Text('Yearly Total Profit'),
                                      ],
                                    ),
                                    Text('$monthTotalProfit')
                                  ],
                                )),
                          )
                        ],
                      )),
                  Center(
                    child: Positioned(
                        top: 0,
                        right: 10,
                        child: ToggleButtons(
                          children: <Widget>[
                            Text('Day'),
                            Text('Month'),
                            Text('Year'),
                          ],
                          onPressed: (int index) {
                            setState(() {
                              isSelected = [false, false, false];
                              isSelected[index] = !isSelected[index];
                            });
                          },
                          isSelected: isSelected,
                        )),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 500,
                    child: new charts.LineChart(
                      _getgenMonth(),
                      animate: false,
                    ),
                  ),
                ],
              ));
            }
            return CircularProgressIndicator();
          },
        ),
      )));
    } else {
      return (Container(
          child: Scaffold(
        body: FutureBuilder(
          future: getDataGenYear(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return (ListView(
                padding: EdgeInsets.symmetric(vertical: 15),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.query_stats),
                                        Text('Yearly Total Production'),
                                      ],
                                    ),
                                    Text('$yearTotalProduction')
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.attach_money),
                                        Text('Yearly Total Profit'),
                                      ],
                                    ),
                                    Text('$yearTotalProfit')
                                  ],
                                )),
                          )
                        ],
                      )),
                  Center(
                    child: Positioned(
                        top: 0,
                        right: 10,
                        child: ToggleButtons(
                          children: <Widget>[
                            Text('Day'),
                            Text('Month'),
                            Text('Year'),
                          ],
                          onPressed: (int index) {
                            setState(() {
                              isSelected = [false, false, false];
                              isSelected[index] = !isSelected[index];
                            });
                          },
                          isSelected: isSelected,
                        )),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 500,
                    child: new charts.LineChart(
                      _getgenYear(),
                      animate: false,
                    ),
                  ),
                ],
              ));
            }
            return CircularProgressIndicator();
          },
        ),
      )));
    }
  }

  //_getProfitData
  _secondTab() {
    return (Container(
        child: Scaffold(
      body: FutureBuilder(
        future: getDataGenDay(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return (ListView(
              children: [
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width / 2,
                          child: Card(
                              elevation: 3,
                              color: HexColor('#274070'),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                        "assets/images/energie.png",
                                      ),
                                      Text(
                                        'Today',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Text('$dailyTotalProduction',
                                      style: TextStyle(color: Colors.white))
                                ],
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width / 2,
                          child: Card(
                              elevation: 3,
                              color: HexColor('#274070'),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                        "assets/images/energie.png",
                                      ),
                                      Text(
                                        'All',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Text('$yearTotalProduction',
                                      style: TextStyle(color: Colors.white))
                                ],
                              )),
                        )
                      ],
                    )),
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width / 2,
                          child: Card(
                              elevation: 3,
                              color: HexColor('#274070'),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                        "assets/images/money.png",
                                      ),
                                      Text(
                                        'Today',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Text('$dailyTotalProfit',
                                      style: TextStyle(color: Colors.white))
                                ],
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width / 2,
                          child: Card(
                              elevation: 5,
                              color: HexColor('#274070'),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                        "assets/images/money.png",
                                      ),
                                      Text(
                                        'All',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Text('$yearTotalProfit',
                                      style: TextStyle(color: Colors.white))
                                ],
                              )),
                        )
                      ],
                    )),
              ],
            ));
          }
          return CircularProgressIndicator();
        },
      ),
    )));
  }

//info
  _thirdTab() {
    return (Container(
        child: Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 40,
        height: MediaQuery.of(context).size.height / 1.5,
        child: Center(
          child: ColoredBox(
            color: Colors.white,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: (Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Product Info')],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text('Product Name :'), Text('Growatt')],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text('Product Ref :'), Text('#232442423')],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Total Production :'),
                        Text('$yearTotalProfit DT')
                      ],
                    )
                  ],
                ),
              )),
            ),
          ),
        ),
      ),
    )));
  }

  @override
  void initState() {
    getDataGenDay();
    getDataGenMonth();
    getDataGenYear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: HexColor('#2f4d86')),
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              bottom: TabBar(
                tabs: [
                  Row(
                    children: [
                      Icon(Icons.query_stats),
                      Tab(text: 'Production'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      Tab(text: 'Profit'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.info_outline),
                      Tab(text: ' Info'),
                    ],
                  ),
                ],
              ),
              title: Text('Charts'),
              backgroundColor: HexColor("#2f4d86"),
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
                          title: Text('Logout',
                              style: TextStyle(color: Colors.white)),
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
            body: TabBarView(
              children: <Widget>[
                _firstTab(),
                _secondTab(),
                _thirdTab(),
              ],
            ),
          ),
        ));
  }
}
