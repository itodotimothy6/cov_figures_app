import 'package:covfiguresapp/constants.dart';
import 'package:covfiguresapp/pages/summary_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:covfiguresapp/services/location.dart';
import 'package:covfiguresapp/models/cov_data.dart';

class LoadingPage extends StatefulWidget {
  static const id = '/';

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    Location location = Location(
      lat: position.latitude,
      long: position.longitude,
    );

    CovData locationData = await location.getLocationData();

    print(locationData.countyName);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SummaryPage(locationData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightPurple,
      body: Center(
//        child: SpinKitCircle(
//          color: kMainPurple,
//          size: 100.0,
//        ),
          ),
    );
  }
}
