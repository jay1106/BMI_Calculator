import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/functions.dart';
import 'package:bmi_calculator/screens/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:alert/alert.dart';
import 'package:google_fonts/google_fonts.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // late Gender selectedGender;

  // Color maleCardColour = inactiveCardColour;
  // Color femaleCardColour = inactiveCardColour;

  // void updateColour(int gender) {
  //   if (gender == 1) {
  //     if (maleCardColour == inactiveCardColour) {
  //       // ignore: unnecessary_statements
  //       maleCardColour == activeCardColour;
  //     } else {2
  //       // ignore: unnecessary_statements
  //       maleCardColour == inactiveCardColour;
  //     }
  //   }
  // }

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
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            Alert(
                                    message: 'you are calculating for Male',
                                    shortDuration: true)
                                .show();
                          },
                          child: container(
                              colour: kinactiveCardColour,
                              ContainerChild: ContainerInput(
                                  icon: FontAwesomeIcons.mars,
                                  label: 'MALE')))),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Alert(
                                message: 'you are calculating for Female',
                                shortDuration: true)
                            .show();
                      },
                      child: container(
                        colour: kinactiveCardColour,
                        ContainerChild: ContainerInput(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: container(
                colour: kactiveCardColour,
                ContainerChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: klabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: knumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: klabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 250,
                          label: height.round().toString(),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: new container(
                      colour: kactiveCardColour,
                      ContainerChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: klabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: knumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(
                                    () {
                                      weight--;
                                    },
                                  );
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: new container(
                      colour: kactiveCardColour,
                      ContainerChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: klabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: knumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(
                                    () {
                                      age--;
                                    },
                                  );
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                          bmiResult: calc.calculateBMI(),
                          interpration: calc.getInterpretation(),
                          resultText: calc.getResult())),
                );
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
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
        )));
  }
}
