import 'package:covfiguresapp/components/summary_page_header.dart';
import 'package:covfiguresapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:covfiguresapp/components/numbers_section.dart';
import 'package:covfiguresapp/components/rates_section.dart';
import 'package:covfiguresapp/components/buttom_info_icon_button.dart';

class SummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: kBackgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SummaryPageHeader(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                NumbersSection(),
                RatesSection(),
                BottomInfoIconButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
