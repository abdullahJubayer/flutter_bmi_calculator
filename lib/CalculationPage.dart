import 'package:bmi_app/Constant.dart';
import 'package:bmi_app/InputPage.dart';
import 'package:bmi_app/MyBoxContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculationPage extends StatelessWidget {
  final String bmi;
  final String message;
  final String suggestion;
  CalculationPage(
      {@required this.bmi, @required this.message, @required this.suggestion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              "Result",
              style: TextStyle(
                fontSize: 50.0,
              ),
            ),
          ),
          Expanded(
            child: MyBoxContainer(
              bgColor: KActiveCardColor,
              boxChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    message.toUpperCase(),
                    style: TextStyle(color: Colors.green, fontSize: 20.0),
                  ),
                  Text(
                    bmi,
                    style:
                        TextStyle(fontSize: 70.0, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    suggestion,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InputPage()));
            },
            child: Container(
              width: double.infinity,
              color: Colors.red,
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.only(top: 10.0),
              child: Center(
                child: Text(
                  "RECALCULATE",
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
