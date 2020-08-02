import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReusableCode extends StatelessWidget {

  final Color colour;
  final Widget CardChild;
  final Function detect_tap;
  // ignore: non_constant_identifier_names
  ReusableCode({@required this.colour, this.CardChild, this.detect_tap});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: detect_tap,
      child: Container(
        child: CardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}

