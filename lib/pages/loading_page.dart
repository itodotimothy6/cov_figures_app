import 'package:covfiguresapp/globals.dart';
import 'package:covfiguresapp/pages/summary_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:covfiguresapp/services/location.dart';
import 'package:covfiguresapp/models/cov_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:io';

class LoadingPage extends StatefulWidget {
  static const id = '/';
  final bool initialPage;

  LoadingPage({this.initialPage});

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    if (widget.initialPage) getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightPurple,
      body: Center(
        child: SpinKitCircle(
          color: kMainPurple,
          size: 100.0,
        ),
      ),
    );
  }

  void getLocationData() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      Location location =
          Location(lat: position.latitude, long: position.longitude);

      CovData locationData = await location.getLocationData();
      userLocations.add(locationData);

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SummaryPage(locationData);
      }));
    } catch (e) {
      print(e);
      print("The app failed to recognize the location of your phone");

      showAlertDialog();
    }
  }

  void showAlertDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        if (Platform.isAndroid) {
          return AlertDialog(
            title: Text("Error getting location data"),
            content: Text(
                'Please check internet connection or enable app to use your phone\'s location'),
            elevation: 24,
            actions: <Widget>[
              FlatButton(
                child: Text("Try again"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoadingPage(initialPage: true);
                  }));
                },
              )
            ],
          );
        }
        return CupertinoAlertDialog(
          title: Text("Error getting location data"),
          content: Text(
              'Please check internet connection or enable app to use your phone\'s location'),
          actions: <Widget>[
            FlatButton(
              child: Text("Try again"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoadingPage(initialPage: true);
                }));
              },
            )
          ],
        );
      },
    );
  }
}
