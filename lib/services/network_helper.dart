import 'package:covfiguresapp/model/dataset.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:covfiguresapp/model/dataset.dart';

Future<Dataset> fetchStats(url) async {
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Dataset.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data sets');
  }
}







