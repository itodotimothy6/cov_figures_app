import 'package:covfiguresapp/services/network_helper.dart';


class Dataset{
  //Divided the deaths and cases into two data points- current and previous, which we would get from our requested data. We would use this to calculate the 'recent' deaths and cases

  //Current confirmed cases
  int currentCases;
  //Previous confirmed cases
  int previousCases;
  int currentDeaths;
  int previousDeaths;
  int population;
//  int currentRecoveries;
//  int previousRecoveries;
  bool onLockdown;

  Dataset({this.currentCases, this.previousCases, this.currentDeaths, this.previousDeaths, this.population, this.onLockdown});

  factory Dataset.fromJson(Map<String, dynamic> json) {

    return Dataset(
      currentCases: json['c'][],
      id: json['id'],
      title: json['title'],
    );
  }


  //Rounding down because in population terms, it's more fitting than rounding up
  int infectedDensity(int currentCases,int population) => ((currentCases/population)*1000).floor();
  //Used the round method as we are dealing with rate
  int mortalityRate(int currentCases,int currentDeaths)=>(((currentDeaths/currentCases)*100)).round();
  int recoveryRate(int currentRecoveries,int currentCases)=>(((currentRecoveries/currentCases)*100)).round();
  int recentDeaths(int currentDeaths,int previousDeaths)=>(currentDeaths-previousDeaths);
  int recentCases(int currentCases,int previousCases)=>(currentCases - previousCases);
  int recentRecoveries(int currentRecoveries,int previousRecoveries)=>(currentRecoveries - previousRecoveries);
  void dangerRank(infectedDensity){
    //Thinking that an array sorted in order of decreasing density can be used as a ranking system with indices incremented by 1. Not sure about this
  }
  double recoveredDeathRatio(int currentRecoveries,int currentDeaths)=> (currentRecoveries/currentDeaths);



}
