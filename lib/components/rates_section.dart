import 'package:covfiguresapp/globals.dart';
import 'package:covfiguresapp/models/cov_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covfiguresapp/components/rates_card.dart';

class RatesSection extends StatelessWidget {
  final CovData data;

  RatesSection({this.data});

  String locationStatus() {
    if (data.status == CoronaStatus.safe) return "Safe";
    if (data.status == CoronaStatus.danger) return "Danger";
    return "Casual";
  }

  @override
  Widget build(BuildContext context) {
    String countyKey = '${data.countyName},${data.stateCode}';
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: RatesCard(
                  position: CardPosition.left,
                  dataKey: 'Infected Density',
                  value: data.infectedDensity.toStringAsFixed(2),
                  unit: '/1000',
                ),
              ),
              Expanded(
                child: RatesCard(
                  position: CardPosition.right,
                  dataKey: "Mortality Rate",
                  value: data.mortalityRate.toStringAsFixed(2),
                  unit: '%',
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RatesCard(
                  position: CardPosition.left,
                  dataKey: 'Danger Rank',
                  value: '#${(CovData.rank[countyKey] + 1).toString()}',
                  unit: '',
                ),
              ),
              Expanded(
                child: RatesCard(
                  position: CardPosition.right,
                  dataKey: 'Status',
                  value: locationStatus(),
                  unit: '',
                ),
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
