import '/Electricity/ElectricityInsertion.dart';
import '/Electricity/Electricityhome.dart';

import '/Electricity/addelectricity.dart';
import '/Electricity/present.dart';
import '/Food/FoodHome.dart';
import '/Food/addfoodwaste.dart';
import '/Food/foodinsertion.dart';
import '/Homepage.dart';
import '/Transport/TransportHome.dart';
import '/carbonsummary/carbonsummary.dart';
import '/intro.dart';
import '/loginpage.dart';
import '/signup.dart';
import '/starterpage.dart';
import '/testscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: const Color.fromARGB(0, 50, 16, 16)));
    return MaterialApp(
      title: 'CO2 Emission Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const IntroPage(),
      home: StarterPage(),
      // home: ElectricityConsumptionPage(),
      // initialRoute: FoodHome.routeName,
      routes: {
        Homepage.routename: (context) => Homepage(),
        LoginPage.routeName: (context) => LoginPage(),
        signupPage.routeName: (context) => signupPage(),
        StarterPage.routeName: (context) => StarterPage(),
        carbonsummary.routeName: (context) => carbonsummary(),
        TransportHome.routeName: (context) => TransportHome(),
        ElectrcityHome.routeName: (context) => ElectrcityHome(),
        FoodHome.routeName: (context) => FoodHome(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
