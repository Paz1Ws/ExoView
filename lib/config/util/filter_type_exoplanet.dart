import 'package:myapp/core/data/models/exoplanet_model.dart';

String classifyExoplanet(double mass, double radius) {
  if (mass < 2 && radius < 1.5) {
    return 'Rocky Planets';
  } else if (mass >= 2 && mass <= 10 || radius >= 1.5 && radius <= 2.5) {
    if (radius <= 2.0) {
      return 'Super Earths';
    } else {
      return 'Water Worlds';
    }
  } else if (mass > 10 && mass <= 50 || radius > 2.5 && radius <= 6.0) {
    return 'Neptunians';
  } else if (mass > 50 || radius > 6.0) {
    return 'Gas Giants';
  } else {
    return 'Unknown';
  }
}

List<Exoplanet> filterExoplanetsByCategory(
    List<Exoplanet> exoplanets, String category) {
  return exoplanets.where((exoplanet) {
    if (category == 'All Exoplanets') {
      return true;
    } else {
      return classifyExoplanet(
              exoplanet.massEarthMass, exoplanet.radiusEarthRadius) ==
          category;
    }
  }).toList();
}
