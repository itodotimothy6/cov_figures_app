import 'package:covfiguresapp/components/summary_page_header.dart';
import 'package:covfiguresapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:covfiguresapp/components/numbers_section.dart';
import 'package:covfiguresapp/components/rates_section.dart';
import 'package:covfiguresapp/components/buttom_info_icon_button.dart';

class SummaryPage extends StatelessWidget {
  static const id = '/';
  @override
  Widget build(BuildContext context) {
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
