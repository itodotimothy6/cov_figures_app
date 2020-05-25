import 'package:flutter/material.dart';
import 'models/cov_data.dart';
import 'package:intl/intl.dart';

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

//Add commas to numbers greater than three digits
String commalize(int num){
  String stringed = num.toString();
  return stringed.replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
}
//Converting the date format

String dateTimeConverter(String dateTime){

  //Take out EDT from date and time
  dateTime = dateTime.substring(0,(dateTime.length)-4);

  var df = DateFormat.yMMMMd('en_US').add_jm();

  var date = DateTime.parse(dateTime);

  return df.format(date);
}

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





