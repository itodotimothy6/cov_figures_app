import 'package:covfiguresapp/components/summary_page_header.dart';
import 'package:covfiguresapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:covfiguresapp/components/numbers_section.dart';
import 'package:covfiguresapp/components/rates_section.dart';
import 'package:covfiguresapp/components/buttom_info_icon_button.dart';
import 'package:covfiguresapp/services/location.dart';
import 'package:covfiguresapp/services/get_data.dart';
import 'package:covfiguresapp/model/cov_data.dart';

class SummaryPage extends StatelessWidget {
  static const id = '/';

  Location location = Location(lat: 40.4406, long: -79.994957);

//  void getData() async {
//    Data data = Data();
//    Map<String, CovData> dataMap = await data.getUSData();
//
//    print(dataMap['New York,NY'].death);
//  }

  @override
  Widget build(BuildContext context) {
    location.myFunction();

    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Container(
            height: 400,
            color: kMainPurple,
          ),
          CustomScrollView(
            slivers: <Widget>[
              SummaryPageHeader(),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    NumbersSection(),
                    Container(
                      height: 15,
                      color: kLightPurple,
                    ),
                    RatesSection(),
                    BottomInfoIconButton(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
