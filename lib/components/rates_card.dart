import 'package:flutter/material.dart';
import 'package:covfiguresapp/constants.dart';
import 'dart:ui';
import 'rate_alert_box.dart';

class RatesCard extends StatelessWidget {
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
      ),
      margin: EdgeInsets.all(10),
      height: kRatesCardHeight,
      child: FlatButton(
        onPressed: () {
          createAlertDialog(context);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
