import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.interpration,
      required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpration;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: GoogleFonts.dancingScript(),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
          )),
          Expanded(
            flex: 5,
            child: container(
                colour: kactiveCardColour,
                ContainerChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      resultText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF24D876),
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmiResult,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 100.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      interpration,
                      style: TextStyle(fontSize: 22.0),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              color: kbottomContainerColour,
              width: double.infinity,
              height: kbuttomContainerHeight,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(20.0),
            ),
          ),
        ],
      ),
    );
  }
}
