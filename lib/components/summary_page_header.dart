import 'package:covfiguresapp/pages/compare_page.dart';
import 'package:flutter/material.dart';
import 'package:covfiguresapp/globals.dart';

class SummaryPageHeader extends StatelessWidget {
  final String name;
  final String stateCode;
  final String lastUpdate;

  SummaryPageHeader({this.name, this.stateCode, this.lastUpdate});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kMainPurple,
      bottom: PreferredSize(
        // Add this code
        preferredSize: Size.fromHeight(kAppBarHeight),
        child: Text(''),
      ),
      expandedHeight: kAppBarExpandedHeight,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
//          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.all(0),
          height: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 8,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    '$name, $stateCode',
                    style: kTextStyle,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'As of $lastUpdate',
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
          color: kPurpleWhite,
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
