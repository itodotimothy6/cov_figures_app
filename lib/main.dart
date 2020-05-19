import 'package:flutter/material.dart';
import 'pages/summary_page.dart';
import 'constants.dart';

void main() => runApp(CovFiguresApp());

class CovFiguresApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cov Figures',
        theme: ThemeData(
          scaffoldBackgroundColor: kPageDivideColor,
        ),
        home: SummaryPage());
  }
}
