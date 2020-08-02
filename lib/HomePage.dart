import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableCode.dart';
import 'CardChild.dart';
import 'constants.dart';
import 'results_page.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

enum Gender{
  male,
  female,
}

class _HomePageState extends State<HomePage> {

  Gender selectgender;
  int height=180;
  int weight=60;
  int age=18;

  double calculate_bmi(int weight, int height){
    return (weight/pow(height/100,2));
  }
  String decide(double bmi){
    if(bmi>25){
      return 'OVERWEIGHT';
    }else if(bmi>18.4){
      return  'NORMAL';
    }else{
      return 'UNDERWEIGHT';
    }
  }

  String decide_interpretation(double bmi){
    if(bmi>25){
      return 'You have a high BMI...try to lose weight and stay healthy';
    }else if(bmi>18.4){
      return 'You have a good BMI...try maintaining it and keep up';
    }else{
      return 'You have a low BMI...try gaining weight';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCode(
                      detect_tap: (){
                        setState(() {
                          selectgender=Gender.male;
                        });
                      },
                      colour: selectgender==Gender.male ? col : col2,
                      CardChild: CardContent(
                        iccon: FontAwesomeIcons.mars,
                        s: 'MALE',
                      ),
                    ),
                ),
                Expanded(
                  child: ReusableCode(
                      detect_tap: (){
                        setState(() {
                          selectgender= Gender.female;
                        });
                      },
                      colour: selectgender==Gender.female ? col: col2,
                      CardChild: CardContent(
                        iccon: FontAwesomeIcons.venus,
                        s: 'FEMALE',
                      ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
          child: ReusableCode(
              colour: col,
              CardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: labelstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:CrossAxisAlignment.baseline ,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                          height.toString(),
                        style: numberstyle,
                      ),
                      Text('cm',
                        style: labelstyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      activeTrackColor: Colors.white,
                      thumbColor: Colors.pink,
                      inactiveTrackColor: Colors.grey[700],
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double value){
                        setState(() {
                          height= value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCode(
                    colour: col,
                    CardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: labelstyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              heroTag: 'button1',
                              onPressed: (){
                                setState(() {
                                  weight+=1;
                                });
                              },
                              child: Icon(FontAwesomeIcons.plus,color: Colors.white),
                              backgroundColor: col3,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            FloatingActionButton(
                              heroTag: 'button2',
                              onPressed: (){
                                setState(() {
                                  weight-=1;
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus,color: Colors.white),
                              backgroundColor: col3,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCode(
                    colour: col,
                    CardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: labelstyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              heroTag: 'button3',
                              onPressed: (){
                                setState(() {
                                  age+=1;
                                });
                              },
                              child: Icon(FontAwesomeIcons.plus,color: Colors.white),
                              backgroundColor: col3,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            FloatingActionButton(
                              heroTag: 'button4',
                              onPressed: (){
                                setState(() {
                                  age-=1;
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus,color: Colors.white),
                              backgroundColor: col3,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child:  Container(
              alignment: Alignment.center,
              color: Colors.pink,
              width: double.infinity,
              height: 60.0,
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                'CALCULATE',
                style: labelstyle,
              ),
            ),
            onTap: () {
              double bmi= calculate_bmi(weight, height);
              String res= decide(bmi);
              String res2= decide_interpretation(bmi);
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context)=> results(
                    The_result: res,
                    BodyMassIndex: bmi,
                    Interprate: res2,
                    ),
                  ),
              );
            },
          ),
          ],
        ),
      );
  }
}
