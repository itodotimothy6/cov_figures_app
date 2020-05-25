class County {
  final String name;
  final double infectedDensity;
  int rank;

  County({this.name, this.infectedDensity, this.rank});

  void setRank(int rank) => this.rank = rank;
}
