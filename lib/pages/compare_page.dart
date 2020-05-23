import 'search_page.dart';
import 'package:flutter/material.dart';
import 'package:covfiguresapp/globals.dart';
import 'package:covfiguresapp/models/cov_data.dart';
import 'package:covfiguresapp/pages/summary_page.dart';

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

  String getValue(CovData data) {
    if (dropdownValue == stats[0]) {
      return data.confirmed.toString();
    } else if (dropdownValue == stats[1]) {
      return data.newConfirmed.toString();
    } else if (dropdownValue == stats[2]) {
      return data.death.toString();
    } else if (dropdownValue == stats[3]) {
      return data.newDeath.toString();
    } else if (dropdownValue == stats[4]) {
      return '${data.infectedDensity.toStringAsFixed(1)}/1000';
    } else {
      return data.mortalityRate.toStringAsFixed(1) + '%';
    }
  }

  Widget statsDropDown() {
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kAppBarHeight + 50),
        child: AppBar(
            backgroundColor: kMainPurple,
            centerTitle: true,
            title: statsDropDown()),
      ),
      body: ListView.builder(
          itemCount: userLocations.length,
          itemBuilder: (BuildContext context, int index) {
            final item = userLocations[index];
            return Dismissible(
              key: Key('${item.countyName},${item.stateCode}'),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  userLocations.removeAt(index);
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
                              Text(
                                '${item.countyName}, ${item.stateCode}',
                                style: kTextStyle.copyWith(
                                  fontSize: 30,
                                  color: kSafeColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                item.lastUpdate,
                                style: kTextStyle.copyWith(
                                  fontSize: 17,
                                  color: kFontColor2,
                                ),
                              ),
                            ],
//
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Center(
                              child: Text(
                            getValue(item),
                            style: kTextStyle.copyWith(
                                fontSize: 30, color: kSafeColor),
                          )),
                          height: 110,
                          decoration: BoxDecoration(
                            color: kSafeBackgroundColor,
                            border: Border(left: BorderSide(color: kSafeColor)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: kSafeColor,
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
}
