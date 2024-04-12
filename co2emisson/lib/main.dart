import 'package:co2emisson/Electricity/ElectricityInsertion.dart';
import 'package:co2emisson/Electricity/Electricityhome.dart';
import 'package:co2emisson/Food/FoodHome.dart';
import 'package:co2emisson/Homepage.dart';
import 'package:co2emisson/Transport/TransportHome.dart';
import 'package:co2emisson/carbonsummary/carbonsummary.dart';
import 'package:co2emisson/intro.dart';
import 'package:co2emisson/loginpage.dart';
import 'package:co2emisson/signup.dart';
import 'package:co2emisson/starterpage.dart';
import 'package:co2emisson/testscreen.dart';
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
      home: const IntroPage(),
      // home: Homepage(),
      // home: ElectricityInsertion(),

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
