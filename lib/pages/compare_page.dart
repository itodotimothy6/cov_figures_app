import 'search_page.dart';
import 'package:flutter/material.dart';
import 'package:covfiguresapp/constants.dart';
import 'package:covfiguresapp/components/stats_dropdown.dart';

class ComparePage extends StatefulWidget {
  static const id = 'compare_page';
  @override
  _ComparePageState createState() => _ComparePageState();
}

class _ComparePageState extends State<ComparePage> {
  final List<String> entries = <String>['A', 'B', 'C'];

  final List<Color> colors = <Color>[kSafeColor, kCasualColor, kDangerColor];

  final List<Color> backgroundColors = <Color>[
    kSafeBackgroundColor,
    kCasualBackgroundColor,
    kDangerBackgroundColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kAppBarHeight + 50),
        child: AppBar(
            backgroundColor: kBackgroundColor,
            centerTitle: true,
            title: StatsDropDown()),
      ),
      body: ListView.builder(
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            final item = entries[index];
//            int index = i % 3;
            return Dismissible(
              key: Key(item),
              onDismissed: (direction) {
                setState(() {
                  entries.removeAt(index);
                });
              },
              background: Container(
                color: Colors.red,
                margin: EdgeInsets.only(top: 30),
                alignment: AlignmentDirectional.centerEnd,
                child: Icon(
                  Icons.delete,
                  size: 50,
                  color: kPrimaryColor,
                ),
              ),
              direction: DismissDirection.endToStart,
              child: Container(
                margin: EdgeInsets.only(top: 30),
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
                              "Little Rock, AR",
                              style: kTextStyle.copyWith(
                                fontSize: 30,
                                color: colors[index],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "As of May 11, 2020 6:30pm",
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
                          "50%",
                          style: kTextStyle.copyWith(
                              fontSize: 30, color: colors[index]),
                        )),
                        height: 110,
                        decoration: BoxDecoration(
                          color: backgroundColors[index],
                          border:
                              Border(left: BorderSide(color: colors[index])),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: colors[index],
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          child: Icon(
            Icons.add,
            color: kBackgroundColor,
            size: 40,
          ),
          onPressed: () {
            Navigator.pushNamed(context, SearchPage.id);
          }),
    );
  }
}
