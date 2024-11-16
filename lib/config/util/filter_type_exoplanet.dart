String classifyExoplanet(double mass, double radius) {
  if (mass >= 2 && mass <= 5) {
    return 'Water World';
  } else if (mass >= 0.5 && mass < 2 && radius < 1.25) {
    return 'Rocky Planet';
  } else if (mass >= 2 && radius >= 1.25 && radius <= 1.5) {
    return 'Super Earth';
  } else if (radius >= 6) {
    return 'Gas Giant';
  } else if (mass >= 10 && mass <= 50 && radius >= 2 && radius <= 6) {
    return 'Neptunian';
  } else {
    return 'Unknown';
  }
}
