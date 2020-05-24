import 'package:covfiguresapp/globals.dart';
import 'package:covfiguresapp/pages/summary_page.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:covfiguresapp/services/location.dart';
import 'package:covfiguresapp/models/cov_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

  void getLocationData() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    Location location =
        Location(lat: position.latitude, long: position.longitude);

    CovData locationData = await location.getLocationData();
    userLocations.add(locationData);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SummaryPage(locationData);
    }));
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
}
