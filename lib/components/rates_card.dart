import 'package:flutter/material.dart';
import 'package:covfiguresapp/constants.dart';
import 'dart:ui';
import 'rate_alert_box.dart';

enum CardPosition { left, right }

class RatesCard extends StatelessWidget {
  final CardPosition position;

  RatesCard({this.position});

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return RateAlertBox();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kBackgroundColor,
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
              'Death Rate',
              style: kTextStyle.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '20%',
              style: kTextStyle.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
