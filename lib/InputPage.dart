import 'package:bmi_app/BmiBrain.dart';
import 'package:bmi_app/Constant.dart';
import 'package:bmi_app/MyBoxChild.dart';
import 'package:bmi_app/MyBoxContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'CalculationPage.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum GenderType { Male, Female }

class _InputPageState extends State<InputPage> {
  GenderType genderType;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                MyGestureDetector(
                  onTap: () {
                    setState(() {
                      genderType = GenderType.Male;
                    });
                  },
                  child: MyBoxContainer(
                    bgColor: genderType == GenderType.Male
                        ? KActiveCardColor
                        : KInActiveCardColor,
                    boxChild: MyBoxChild(
                      icon: FontAwesomeIcons.mars,
                      text: 'Male',
                    ),
                  ),
                ),
                MyGestureDetector(
                  onTap: () {
                    setState(() {
                      genderType = GenderType.Female;
                    });
                  },
                  child: MyBoxContainer(
                    bgColor: genderType == GenderType.Female
                        ? KActiveCardColor
                        : KInActiveCardColor,
                    boxChild: MyBoxChild(
                      icon: FontAwesomeIcons.venus,
                      text: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyBoxContainer(
              bgColor: KActiveCardColor,
              boxChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: KNormalTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: KNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: KNormalTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x1fEB1555),
                        rangeThumbShape: RoundRangeSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 280,
                      onChanged: (double val) {
                        setState(() {
                          height = val.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyBoxContainer(
                    bgColor: KActiveCardColor,
                    boxChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: KNormalTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus),
                            RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyBoxContainer(
                    bgColor: KActiveCardColor,
                    boxChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: KNormalTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus),
                            RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BmiBrain brain = BmiBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CalculationPage(
                            bmi: brain.calculateBmi(),
                            message: brain.getResult(),
                            suggestion: brain.getSuggestion(),
                          )));
            },
            child: Container(
              width: double.infinity,
              color: Colors.red,
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.only(top: 10.0),
              child: Center(
                child: Text(
                  "CALCULATE",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyGestureDetector extends StatelessWidget {
  final Function onTap;
  final Widget child;
  MyGestureDetector({@required this.onTap, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: child,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;

  RoundIconButton({@required this.onPressed, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF8D8E90),
    );
  }
}
