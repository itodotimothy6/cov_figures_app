import 'package:flutter/material.dart';
import 'package:covfiguresapp/globals.dart';
import 'dart:ui';
import 'rate_alert_box.dart';

enum CardPosition {
  left,
  right,
}

class RatesCard extends StatelessWidget {
  final CardPosition position;
  final String dataKey;
  final String value;
  final String unit;

  RatesCard({this.position, this.value, this.dataKey, this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kMainPurple,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 3.0,
            spreadRadius: 0.0,
            offset: Offset(0.0, 4.0),
          ),
        ],
      ),
      margin: this.position == CardPosition.left
          ? EdgeInsets.only(right: 20, bottom: 30)
          : EdgeInsets.only(left: 20, bottom: 30),
      height: kRatesCardHeight,
      child: FlatButton(
        onPressed: () {
          createAlertDialog(context);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            SizedBox(
//              height: 15,
//            ),
            Text(
              dataKey,
              style: kTextStyle.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: MainAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  value,
                  style: kTextStyle.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(
                  unit,
                  style: kTextStyle.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return RateAlertBox();
        });
  }
}
