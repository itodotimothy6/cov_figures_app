import 'package:flutter/cupertino.dart';
//import 'dart:io' show Platform;
import 'search_page.dart';
import 'package:flutter/material.dart';
import 'package:covfiguresapp/globals.dart';
import 'package:covfiguresapp/models/cov_data.dart';
import 'package:covfiguresapp/pages/summary_page.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ComparePage extends StatefulWidget {
  static const id = 'compare_page';
  @override
  _ComparePageState createState() => _ComparePageState();
}

class _ComparePageState extends State<ComparePage> {
  String dropdownValue = 'Confirmed';

  List<String> stats = [
    'Confirmed',
    'Recent',
    'Deaths',
    'Recent Deaths',
    'Infected Density',
    'Mortality Rate',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kAppBarHeight + 50),
        child: AppBar(
            leading: Container(),
            backgroundColor: kMainPurple,
            centerTitle: true,
            title: statsDropDown()),
      ),
      body: ListView.builder(
          itemCount: userLocations.length,
          itemBuilder: (BuildContext context, int index) {
            final itemIndex = userLocations.keys.toList()[index];
            CovData item = userLocations[itemIndex];
            return Dismissible(
              key: Key('${item.countyName}, ${item.stateCode}'),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  userLocations.remove('${item.countyName}, ${item.stateCode}');
                });
              },
              background: Container(
                color: Colors.red,
                margin: EdgeInsets.only(top: 15),
                alignment: AlignmentDirectional.centerEnd,
                child: Icon(
                  Icons.delete,
                  size: 50,
                  color: kPurpleWhite,
                ),
              ),
              child: FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SummaryPage(item);
                  }));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 110,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              AutoSizeText(
                                '${item.countyName}, ${item.stateCode}',
                                style: kTextStyle.copyWith(
                                  fontSize: 30,
                                  color: item.color,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                dateTimeConverter(item.lastUpdate),
                                style: kTextStyle.copyWith(
                                  fontSize: 17,
                                  color: kFontColor2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Center(
                              child: AutoSizeText(
                            getValue(item),
                            maxLines: 1,
                            minFontSize: 5,
                            style: kTextStyle.copyWith(
                              color: item.color,
                              fontSize: 30,
                            ),
                          )),
                          height: 110,
                          decoration: BoxDecoration(
                            color: item.backGroundColor,
                            border: Border(left: BorderSide(color: item.color)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: item.color,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 1.0,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: kPurpleWhite,
          child: Icon(
            Icons.add,
            color: kMainPurple,
            size: 40,
          ),
          onPressed: () {
            Navigator.pushNamed(context, SearchPage.id);
          }),
    );
  }

  String getValue(CovData data) {
    if (dropdownValue == stats[0]) {
      return commalize(data.confirmed);
    } else if (dropdownValue == stats[1]) {
      return commalize(data.newConfirmed);
    } else if (dropdownValue == stats[2]) {
      return commalize(data.death);
    } else if (dropdownValue == stats[3]) {
      return commalize(data.newDeath);
    } else if (dropdownValue == stats[4]) {
      return '${data.infectedDensity.toStringAsFixed(2)} / 1000';
    } else {
      return data.mortalityRate.toStringAsFixed(2) + '%';
    }
  }

  Widget statsDropDown() {
    return Container(
      height: 70,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: androidDropdown(),
      ),
    );
  }

//  Widget iosPicker() {
//    return CupertinoPicker(
//      itemExtent: 36,
//      backgroundColor: kMainPurple,
//      children: stats.map((stat) => Text(stat)).toList(),
//      onSelectedItemChanged: (value) {
//        setState(() {
//          dropdownValue = stats[value];
//        });
//      },
//    );
//  }

  DropdownButton<String> androidDropdown() {
    return DropdownButton<String>(
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
      underline: Container(
        padding: EdgeInsets.only(top: 10),
        color: kLightPurple,
        height: 1,
      ),
      focusColor: Colors.red,
      items: stats.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
