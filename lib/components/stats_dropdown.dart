import 'package:flutter/material.dart';
import 'package:covfiguresapp/constants.dart';

class StatsDropDown extends StatefulWidget {
  @override
  _StatsDropDownState createState() => _StatsDropDownState();
}

class _StatsDropDownState extends State<StatsDropDown> {
  String dropdownValue = 'Death Rate';
  List<String> stats = ['Death Rate', 'Confirmed', 'Free', 'Four'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: kFontColor1,
          ),
          iconSize: 34,
          elevation: 16,
          style: TextStyle(color: kFontColor1, fontSize: 24),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          underline: Container(),
          items: stats.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
