import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({this.url});

  final String url;

  Future getData() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Connection failed");
      throw Exception('Failed to connect to URL');
    }
  }
}
