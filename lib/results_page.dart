import 'package:bmi_calculator/ReusableCode.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class results extends StatelessWidget {

  results({@required this.Interprate, @required this.BodyMassIndex, @required this.The_result});
  final String Interprate;
  final double BodyMassIndex;
  final String The_result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.fromLTRB(35.0, 15.0, 0.0, 0.0),
              child: Text(
                'Your Result',
                style: result_style,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCode(
              colour: col,
              CardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    The_result,
                    style: result_text_style,
                  ),
                  Text(
                      BodyMassIndex.toStringAsFixed(1),
                    style: bmi_style,
                  ),
                  Text(
                    Interprate,
                    style: stylee,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child:  Container(
              alignment: Alignment.center,
              color: Colors.pink,
              width: double.infinity,
              height: 60.0,
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                'RE-CALCULATE',
                style: labelstyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
