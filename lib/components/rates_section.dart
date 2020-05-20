import 'package:covfiguresapp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covfiguresapp/components/rates_card.dart';

class RatesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: RatesCard(position: CardPosition.left),
              ),
              Expanded(
                child: RatesCard(position: CardPosition.right),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RatesCard(position: CardPosition.left),
              ),
              Expanded(
                child: RatesCard(position: CardPosition.right),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RatesCard(position: CardPosition.left),
              ),
              Expanded(
                child: RatesCard(position: CardPosition.right),
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: kPurpleWhite,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );
  }
}
