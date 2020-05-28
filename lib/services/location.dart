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

    String key =
        '${county["results"][0]["county_name"]}, ${county["results"][0]["state_code"]}';
    var data = await Data().getUSData();

    CovData.rank = rankCounties(data);

    return data[key];
  }

  Map<String, int> rankCounties(Map<String, CovData> data) {
    Map<String, int> rankOf = {};
    List<County> counties = [];

    data.forEach((k, v) => counties.add(County(
          name: k,
          infectedDensity: v.infectedDensity,
          rank: 0,
        )));

    counties.sort((a, b) => b.infectedDensity.compareTo(a.infectedDensity));

    double prevDensity = counties[0].infectedDensity;
    int rank = 0;

    for (County county in counties) {
      if (county.infectedDensity < prevDensity) {
        ++rank;
        prevDensity = county.infectedDensity;
      }
      county.setRank(rank);
      rankOf[county.name] = rank;
    }

    return rankOf;
  }
}
