import 'package:covfiguresapp/pages/loading_page.dart';
import 'package:covfiguresapp/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'pages/compare_page.dart';
import 'constants.dart';
import 'pages/summary_page.dart';

void main() => runApp(CovFiguresApp());

class CovFiguresApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cov Figures',
      theme: ThemeData(
        scaffoldBackgroundColor: kLightPurple,
        canvasColor: kMainPurple,
      ),
      initialRoute: LoadingPage.id,
      routes: {
        LoadingPage.id: (context) => LoadingPage(),
//        SummaryPage.id: (context) => SummaryPage(),
        ComparePage.id: (context) => ComparePage(),
        SearchPage.id: (context) => SearchPage(),
      },
    );
  }
}
