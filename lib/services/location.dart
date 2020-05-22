import 'package:covfiguresapp/model/cov_data.dart';
import 'package:covfiguresapp/services/network_helper.dart';
import 'package:covfiguresapp/services/get_data.dart';

class Location {
  static const baseUrl = 'https://geo.fcc.gov/api/census/area';
  final lat;
  final long;

  Location({this.lat, this.long});

  Future<Map<String, CovData>> myFunction() async {
    String url = '$baseUrl?lat=${this.lat}&lon=${this.long}&format=json';
    NetworkHelper networkHelper = NetworkHelper(url: url);

    var county = await networkHelper.getData();

    // TODO: Logic for US & Other countries

    String key =
        '${county["results"][0]["county_name"]},${county["results"][0]["state_code"]}';

    Data data = Data();

    return await data.getUSData();
  }
}
