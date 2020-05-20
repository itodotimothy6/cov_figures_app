import 'package:flutter/material.dart';
import 'package:covfiguresapp/constants.dart';
import 'case_number_box.dart';

class NumbersSection extends StatelessWidget {
  final List<Widget> records = [
    CaseNumberBox(),
    SizedBox(
      height: 30,
    ),
  ];

  final numbersSectionTextStyle = kTextStyle.copyWith(
    color: kFontColor2,
    fontSize: 18,
    letterSpacing: 1,
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
            style: numbersSectionTextStyle,
          ),
          Text(
            dataValue,
            style: numbersSectionTextStyle,
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
        decoration: BoxDecoration(
          color: kPrimaryColor,
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
}
