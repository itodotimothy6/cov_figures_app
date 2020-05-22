import 'package:covfiguresapp/components/summary_page_header.dart';
import 'package:covfiguresapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:covfiguresapp/components/numbers_section.dart';
import 'package:covfiguresapp/components/rates_section.dart';
import 'package:covfiguresapp/components/buttom_info_icon_button.dart';
import 'package:covfiguresapp/services/location.dart';
import 'package:covfiguresapp/services/get_data.dart';
import 'package:covfiguresapp/models/cov_data.dart';

class SummaryPage extends StatelessWidget {
  static const id = 'summary_page';

  final CovData data;

  SummaryPage(this.data);

  @override
  Widget build(BuildContext context) {
    print("The location data is here ${data.stateName}");
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
              SummaryPageHeader(
                name: data.countyName,
                stateCode: data.stateCode,
                lastUpdate: data.lastUpdate,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    NumbersSection(data: data),
                    Container(height: 15, color: kLightPurple),
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
