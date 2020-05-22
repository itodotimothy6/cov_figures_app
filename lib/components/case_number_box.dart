import 'package:flutter/material.dart';
import 'package:covfiguresapp/constants.dart';

class CaseNumberBox extends StatelessWidget {
  final cases;

  CaseNumberBox({@required this.cases});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(17),
      height: 200,
      decoration: BoxDecoration(
        color: kSafeBackgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: kSafeColor,
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
                  color: kSafeColor,
                  fontSize: 70,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                'out of the 700,000 confirmed cases in the world',
                style: kTextStyle.copyWith(
                  color: kSafeColor,
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
