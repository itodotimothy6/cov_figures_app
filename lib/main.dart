import 'package:flutter/material.dart';
import 'screens/summary_screen.dart';

const kBackgroundColor = Color(0xFF2F2F31);
const kPrimaryColor = Color(0xFF1B1B32);
const kDangerColor = Color(0xFFFD434C);
const kCasualColor = Color(0xFFFEA202);
const kSafeColor = Color(0xFF7BCA9F);
const kTextColor = Color(0xFFFAFBF4);

void main() => runApp(CovFiguresApp());

class CovFiguresApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cov Figures',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundColor,
        ),
        home: SummaryScreen());
  }
}
