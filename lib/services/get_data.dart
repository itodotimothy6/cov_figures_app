import 'package:covfiguresapp/globals.dart';
import 'package:covfiguresapp/models/cov_data.dart';
import 'package:covfiguresapp/services/network_helper.dart';
import 'package:covfiguresapp/data/states.dart';

const url = 'https://covid19-us-api.herokuapp.com/county';

class Data {
  // TODO: Function for other countries data

  Future<Map<String, CovData>> getUSData() async {
    NetworkHelper network = NetworkHelper(url: url);
    var countiesData = await network.getData();
    Map<String, CovData> countiesDataMap = {};

    for (var data in countiesData["message"]) {
      String key = '${data["county_name"]},${stateCode[data["state_name"]]}';
      double countyPopulation =
          population[key] != null ? double.parse(population[key]) : 1000000;

      countiesDataMap[key] = CovData(
        countyName: data['county_name'],
        stateName: data['state_name'],
        stateCode: stateCode[data['state_name']],
        countryName: 'United States',
        confirmed: data['confirmed'],
        newConfirmed: data['new'],
        death: data['death'],
        newDeath: data['new_death'],
        fatalityRate: data['fatality_rate'],
        lastUpdate: data['last_update'],
        infectedDensity: data['confirmed'] * 1000 / countyPopulation,
        mortalityRate: data['death'] / data['confirmed'],
      );
    }

    return countiesDataMap;
  }
}
