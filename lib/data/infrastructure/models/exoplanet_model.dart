class Exoplanet {
  final String planetName;
  final int discoveryYear;
  final String discoveryMethod;
  final double orbitalPeriod;
  final double planetRadius;
  final double planetMass;
  final double equilibriumTemperature;

  Exoplanet({
    required this.planetName,
    required this.discoveryYear,
    required this.discoveryMethod,
    required this.orbitalPeriod,
    required this.planetRadius,
    required this.planetMass,
    required this.equilibriumTemperature,
  });

  factory Exoplanet.fromJson(Map<String, dynamic> json) {
    return Exoplanet(
      planetName: json['planetName'],
      discoveryYear: json['discoveryYear'],
      discoveryMethod: json['discoveryMethod'],
      orbitalPeriod: json['orbitalPeriod'],
      planetRadius: json['planetRadius'],
      planetMass: json['planetMass'],
      equilibriumTemperature: json['equilibriumTemperature'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'planetName': planetName,
      'discoveryYear': discoveryYear,
      'discoveryMethod': discoveryMethod,
      'orbitalPeriod': orbitalPeriod,
      'planetRadius': planetRadius,
      'planetMass': planetMass,
      'equilibriumTemperature': equilibriumTemperature,
    };
  }
}