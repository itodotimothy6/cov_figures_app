import 'package:covfiguresapp/models/county.dart';
import 'package:covfiguresapp/models/cov_data.dart';
import 'package:covfiguresapp/services/network_helper.dart';
import 'package:covfiguresapp/services/get_data.dart';

class Location {
  static const baseUrl = 'https://geo.fcc.gov/api/census/area';
  final lat;
  final long;

  Location({this.lat, this.long});

  Future<CovData> getLocationData() async {
    String url = '$baseUrl?lat=${this.lat}&lon=${this.long}&format=json';
    NetworkHelper networkHelper = NetworkHelper(url: url);

    var county = await networkHelper.getData();

    // TODO: Logic for US & Other countries

    String key =
        '${county["results"][0]["county_name"]},${county["results"][0]["state_code"]}';

    var data = await Data().getUSData();
    rankCounties(data);

    CovData locationData = data[key];

    return locationData;
  }

  List<County> rankCounties(Map<String, CovData> data) {
    List<County> counties = [];
    data.forEach((k, v) {
      // TODO: Remove this temporary solve
      double infectedDensity;
      try {
        infectedDensity = double.parse(
            v.fatalityRate.substring(0, v.fatalityRate.length - 2));
      } catch (e) {
        infectedDensity = 0;
      }

      counties.add(
        County(name: k, infectedDensity: infectedDensity, rank: 0),
      );
    });

    counties.sort(
      (a, b) => a.infectedDensity.compareTo(b.infectedDensity),
    );

    double prevDensity = counties[0].infectedDensity;
    print(prevDensity);
    int rank = 0;

    for (County county in counties) {
      if (county.infectedDensity > prevDensity) {
        ++rank;
        prevDensity = county.infectedDensity;
      }
      county.setRank(rank);
    }

    return counties;
  }
}
