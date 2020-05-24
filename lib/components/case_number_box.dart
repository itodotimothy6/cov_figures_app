import 'package:flutter/material.dart';
import 'package:covfiguresapp/globals.dart';

class CaseNumberBox extends StatelessWidget {
  final cases;
  final color;
  final backgroundColor;
  final population;

  CaseNumberBox(
      {this.cases, this.backgroundColor, this.color, this.population});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(17),
      height: 200,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: color,
          width: 2.0,
        ),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                '$cases',
                style: kTextStyle.copyWith(
                  color: color,
                  fontSize: 70,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                'out of the $population people in this county',
                style: kTextStyle.copyWith(
                  color: color,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
