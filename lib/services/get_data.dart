import 'package:covfiguresapp/constants.dart';
import 'package:covfiguresapp/models/cov_data.dart';
import 'package:covfiguresapp/services/network_helper.dart';

const url = 'https://covid19-us-api.herokuapp.com/county';

class Data {
  // TODO: Function for other countries data

  Future<Map<String, CovData>> getUSData() async {
    NetworkHelper network = NetworkHelper(url: url);
    var countiesData = await network.getData();
    Map<String, CovData> countiesDataMap = {};

    for (var data in countiesData["message"]) {
      String key = '${data["county_name"]},${kStates[data["state_name"]]}';

      countiesDataMap[key] = CovData(
        countyName: data['county_name'],
        stateName: data['state_name'],
        stateCode: kStates[data['state_name']],
        countryName: 'United States',
        confirmed: data['confirmed'],
        newConfirmed: data['new'],
        death: data['death'],
        newDeath: data['new_death'],
        fatalityRate: data['fatality_rate'],
        lastUpdate: data['last_update'],
      );
    }

    return countiesDataMap;
  }
}
