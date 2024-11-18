import 'package:flutter/material.dart';
import 'package:myapp/core/data/data.dart';

RangeValues _getRangeValues(
    List<Exoplanet> exoplanets, double Function(Exoplanet) getProperty) {
  double minValue = getProperty(exoplanets.reduce((value, element) =>
      getProperty(value) < getProperty(element) ? value : element));
  double maxValue = getProperty(exoplanets.reduce((value, element) =>
      getProperty(value) > getProperty(element) ? value : element));
  return RangeValues(minValue, maxValue);
}

RangeValues getDiscoveryYearRange(List<Exoplanet> exoplanets) {
  return _getRangeValues(
      exoplanets, (exoplanet) => exoplanet.discoveryYear.toDouble());
}

RangeValues getOrbitalPeriodRange(List<Exoplanet> exoplanets) {
  return _getRangeValues(
      exoplanets, (exoplanet) => exoplanet.orbitalPeriodDays.toDouble());
}

RangeValues getPlanetMassRange(List<Exoplanet> exoplanets) {
  return _getRangeValues(
      exoplanets, (exoplanet) => exoplanet.massEarthMass.toDouble());
}

RangeValues getPlanetRadiusRange(List<Exoplanet> exoplanets) {
  return _getRangeValues(
      exoplanets, (exoplanet) => exoplanet.radiusEarthRadius.toDouble());
}

RangeValues getPlanetTempRange(List<Exoplanet> exoplanets) {
  return _getRangeValues(
      exoplanets, (exoplanet) => exoplanet.radiusEarthRadius.toDouble());
}

RangeValues getPlanetDensityRange(List<Exoplanet> exoplanets) {
  return _getRangeValues(
      exoplanets, (exoplanet) => exoplanet.density.toDouble());
}

RangeValues getTransitDurationRange(List<Exoplanet> exoplanets) {
  return _getRangeValues(
      exoplanets, (exoplanet) => exoplanet.transitDurationHours.toDouble());
}

RangeValues getInsolationFluxRange(List<Exoplanet> exoplanets) {
  return _getRangeValues(
      exoplanets, (exoplanet) => exoplanet.insolationFlux.toDouble());
}
List<Exoplanet> getByControversialOrigin (List<Exoplanet> exoplanets) {
   return exoplanets.where((element) => element.isControversial == true).toList();
}
List<Exoplanet> getByDiscoveryMethod (List<Exoplanet> exoplanets, String discoveryMethod) {
   return exoplanets.where((element) => element.discoveryMethod == discoveryMethod).toList();

  
}
