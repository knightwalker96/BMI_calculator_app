import 'package:flutter/material.dart';
import 'constants.dart';

class CardContent extends StatelessWidget {

  CardContent({this.iccon, this.s});
  final IconData iccon;
  final String s;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iccon,
            size: 80.0,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            s,
            style: labelstyle,
          ),
        ],
      ),
    );
  }
}
