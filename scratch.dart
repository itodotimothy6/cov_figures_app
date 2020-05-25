import 'package:intl/intl.dart';

void main() {
  var df = DateFormat.yMMMMd('en_US').add_jm();

  var date = DateTime.parse("2020-05-23 18:15");

  print(df.format(date));
}
