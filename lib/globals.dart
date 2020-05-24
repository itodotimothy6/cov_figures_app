import 'package:flutter/material.dart';
import 'models/cov_data.dart';

List<CovData> userLocations = [];

// Colors
const kMainPurple = Color(0xFF473F97);
const kLightPurple = Color(0xFFCEC9E4);
const kPurpleWhite = Color(0xFFFBF8FD);
const kDangerColor = Color(0xFFFD434C);
const kDangerBackgroundColor = Color(0xFFFFECED);
const kCasualColor = Color(0xFFFEA202);
const kCasualBackgroundColor = Color(0xFFFFF6E5);
const kSafeColor = Color(0xFF7BCA9F);
const kSafeBackgroundColor = Color(0xFFF1FAF5);
const kFontColor1 = Color(0xFFFAFBF4);
const kFontColor2 = Color(0xFF222222);
const kSearchBarColor = Color(0xFFE8EEF1);

// Text Style
const kTextStyle = TextStyle(
  fontFamily: 'Lato',
  color: Colors.white,
);

// Dimensions
const kRatesCardHeight = 120.0;
const kAppBarHeight = 30.0;
const kAppBarExpandedHeight = 150.0;

//TODO: Function that commalizes numbers

//TODO: Function that converts the date format

// Corona Status Functions
enum CoronaStatus { danger, casual, safe }

Color getColor(CoronaStatus status) {
  if (status == CoronaStatus.casual) return kCasualColor;
  if (status == CoronaStatus.danger) return kDangerColor;
  return kSafeColor;
}

Color getBackgroundColor(CoronaStatus status) {
  if (status == CoronaStatus.casual) return kCasualBackgroundColor;
  if (status == CoronaStatus.danger) return kDangerBackgroundColor;
  return kSafeBackgroundColor;
}

// Temporary solve
CoronaStatus getStatus(double infectedDensity) {
  if (infectedDensity > 100) return CoronaStatus.danger;
  if (infectedDensity > 1) return CoronaStatus.casual;
  return CoronaStatus.safe;
}
