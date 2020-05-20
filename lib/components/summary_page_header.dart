import 'package:covfiguresapp/pages/compare_page.dart';
import 'package:flutter/material.dart';
import 'package:covfiguresapp/constants.dart';

class SummaryPageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kBackgroundColor,
      bottom: PreferredSize(
        // Add this code
        preferredSize: Size.fromHeight(kAppBarHeight),
        child: Text(''),
      ),
      expandedHeight: 200.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Container(
          height: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 8,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'Little Rock, AR',
                    style: kTextStyle,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'As of May 5, 2020, 6:00pm',
                    style: kTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          iconSize: 50,
          color: kPrimaryColor,
          icon: const Icon(
            Icons.menu,
            size: 40,
          ),
          onPressed: () {
            Navigator.pushNamed(context, ComparePage.id);
          },
        ),
      ],
    );
  }
}
