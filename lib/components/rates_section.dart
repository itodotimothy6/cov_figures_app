import 'package:covfiguresapp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covfiguresapp/components/rates_card.dart';

class RatesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: kPrimaryColor,
        padding: EdgeInsets.all(50),
        child: Column(
          children: <Widget>[
            Text(
              'Rates',
              style: kTextStyle.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: kFontColor2,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RatesCard(),
                ),
                Expanded(
                  child: RatesCard(),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RatesCard(),
                ),
                Expanded(
                  child: RatesCard(),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RatesCard(),
                ),
                Expanded(
                  child: RatesCard(),
                ),
              ],
            ),
          ],
        ));
  }
}
