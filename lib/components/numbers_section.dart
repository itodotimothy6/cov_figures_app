import 'package:flutter/material.dart';
import 'package:covfiguresapp/globals.dart';
import 'case_number_box.dart';
import 'package:covfiguresapp/models/cov_data.dart';

class NumbersSection extends StatelessWidget {
  final CovData data;
  NumbersSection({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: kPurpleWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
//        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.only(top: 40, left: 40, right: 40, bottom: 20),
//        padding: EdgeInsets.all(45),
        child: Column(
          children: getRecords(),
        ));
  }

  final numbersSectionTextStyle = kTextStyle.copyWith(
    color: kFontColor2,
    fontSize: 18,
    letterSpacing: 1,
  );

  List<Widget> getRecords() {
    final List<Widget> records = [
      CaseNumberBox(cases: data.confirmed),
      SizedBox(height: 30),
    ];

    records.addAll(createRecord(
      dataKey: "Confirmed Cases",
      dataValue: data.confirmed != null ? data.confirmed.toString() : '-',
    ));
    records.addAll(createRecord(
      dataKey: "Recent Cases",
      dataValue: data.newConfirmed != null ? data.newConfirmed.toString() : '-',
    ));
    records.addAll(createRecord(
      dataKey: "Deaths",
      dataValue: data.death != null ? data.death.toString() : '-',
    ));
    records.addAll(createRecord(
      dataKey: "Recent Deaths",
      dataValue: data.newDeath != null ? data.newDeath.toString() : '-',
    ));

    return records;
  }

  List<Widget> createRecord({String dataKey, String dataValue}) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            dataKey,
            style: numbersSectionTextStyle,
          ),
          Text(
            dataValue,
            style: numbersSectionTextStyle,
          ),
        ],
      ),
      SizedBox(height: 10)
    ];
  }
}
