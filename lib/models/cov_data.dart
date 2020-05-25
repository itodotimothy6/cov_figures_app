import 'package:covfiguresapp/globals.dart';
import 'package:flutter/material.dart';

class CovData {
  CovData({
    this.countyName,
    this.stateName,
    this.stateCode,
    this.countryName,
    this.confirmed,
    this.newConfirmed,
    this.death,
    this.newDeath,
    this.fatalityRate,
    this.lastUpdate,
    this.infectedDensity,
    this.mortalityRate,
    this.status,
    this.color,
    this.backGroundColor,
  });

  final countyName;
  final stateName;
  final stateCode;
  final countryName;
  final confirmed;
  final newConfirmed;
  final death;
  final newDeath;
  final fatalityRate;
  final lastUpdate;
  final double infectedDensity;
  final double mortalityRate;
  final Color color;
  final Color backGroundColor;
  final CoronaStatus status;
  static Map<String, int> rank;
}
