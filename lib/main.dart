import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:bmi_calculator/screens/Input.dart';
import 'package:bmi_calculator/screens/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Colors.purple,
          primaryColor: Color(0xFF0A0E12),
          scaffoldBackgroundColor: Color(0xFF0A0E12),
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white))),
      home: MySplash(),
    );
  }
}

class MySplash extends StatefulWidget {
  // const MySplash({Key? key}) : super(key: key);

  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InputPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'BMI Calculator',
            style: GoogleFonts.dancingScript(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 30,
          ),
          SpinKitFadingCube(
            color: Colors.white,
          )
        ],
      ),
    ));
  }
}
