import 'package:myapp/config/entities/exoplanet.dart';

class Exoplanet extends ExoPlanetEntity {
  Exoplanet({
    super.id,
    required super.planetName,
    required super.isControversial,
    required super.discoveryYear,
    required super.discoveryMethod,
    required super.orbitalPeriodDays,
    required super.radiusEarthRadius,
    required super.massEarthMass,
    required super.equilibriumTemperature,
    required super.density,
    required super.transitDurationHours,
    required super.insolationFlux,
  });

  factory Exoplanet.fromJson(Map<String, dynamic> map, int? index) {
    return Exoplanet(
      id: index != null ? index : map['id']?.toInt() ?? 0,
      planetName: map['pl_name'] ?? '',
      isControversial: map['pl_controv_flag'] == 1,
      discoveryYear: map['disc_year']?.toInt() ?? 0,
      discoveryMethod: map['discoverymethod'] ?? '',
      orbitalPeriodDays: map['pl_orbper']?.toDouble() ?? 0.0,
      radiusEarthRadius: map['pl_rade']?.toDouble() ?? 0.0,
      massEarthMass: map['pl_bmasse']?.toDouble() ?? 0.0,
      equilibriumTemperature: map['pl_eqt']?.toDouble() ?? 0.0,
      density: map['pl_dens']?.toDouble() ?? 0.0,
      transitDurationHours: map['pl_trandur']?.toDouble() ?? 0.0,
      insolationFlux: map['pl_insol']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pl_name': planetName,
      'pl_controv_flag': isControversial ? 1 : 0,
      'disc_year': discoveryYear,
      'discoverymethod': discoveryMethod,
      'pl_orbper': orbitalPeriodDays,
      'pl_rade': radiusEarthRadius,
      'pl_bmasse': massEarthMass,
      'pl_eqt': equilibriumTemperature,
      'pl_dens': density,
      'pl_trandur': transitDurationHours,
      'pl_insol': insolationFlux,
    };
  }

  Exoplanet copyWith({
    int? id,
    String? planetName,
    bool? isControversial,
    int? discoveryYear,
    String? discoveryMethod,
    double? orbitalPeriodDays,
    double? radiusEarthRadius,
    double? massEarthMass,
    double? equilibriumTemperature,
    double? density,
    double? transitDurationHours,
    double? insolationFlux,
  }) {
    return Exoplanet(
      id: id ?? this.id,
      planetName: planetName ?? this.planetName,
      isControversial: isControversial ?? this.isControversial,
      discoveryYear: discoveryYear ?? this.discoveryYear,
      discoveryMethod: discoveryMethod ?? this.discoveryMethod,
      orbitalPeriodDays: orbitalPeriodDays ?? this.orbitalPeriodDays,
      radiusEarthRadius: radiusEarthRadius ?? this.radiusEarthRadius,
      massEarthMass: massEarthMass ?? this.massEarthMass,
      equilibriumTemperature:
          equilibriumTemperature ?? this.equilibriumTemperature,
      density: density ?? this.density,
      transitDurationHours: transitDurationHours ?? this.transitDurationHours,
      insolationFlux: insolationFlux ?? this.insolationFlux,
    );
  }
}
