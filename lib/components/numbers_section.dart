import 'package:flutter/material.dart';
import 'package:covfiguresapp/constants.dart';
import 'case_number_box.dart';

class NumbersSection extends StatelessWidget {
  final List<Widget> records = [
    CaseNumberBox(),
    SizedBox(
      height: 10,
    ),
  ];

  final NumbersSectionTextStyle = kTextStyle.copyWith(
    color: kFontColor2,
    fontSize: 16,
  );

  List<Widget> getRecords() {
    //TODO: use for loop & make this dynamic
    records.addAll(
      createRecord(
        dataKey: "Confirmed Cases",
        dataValue: "12,300",
      ),
    );
    records.addAll(
      createRecord(
        dataKey: "Recovered",
        dataValue: "2,300",
      ),
    );
    records.addAll(
      createRecord(
        dataKey: "Death",
        dataValue: "300",
      ),
    );
    records.addAll(
      createRecord(
        dataKey: "Total Recoveries",
        dataValue: "300",
      ),
    );
    records.addAll(
      createRecord(
        dataKey: "Confirmed Cases",
        dataValue: "12,300",
      ),
    );
    records.addAll(
      createRecord(
        dataKey: "Recovered",
        dataValue: "122,300",
      ),
    );

    return records;
  }

  List<Widget> createRecord({String dataKey, String dataValue}) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            dataKey,
            style: NumbersSectionTextStyle,
          ),
          Text(
            dataValue,
            style: NumbersSectionTextStyle,
          ),
        ],
      ),
      SizedBox(
        height: 10,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: kPrimaryColor,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(35),
        child: Column(
          children: getRecords(),
        ));
  }
}
