//https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=
//select+pl_name,pl_controv_flag,disc_year,discoverymethod,pl_orbper,pl_rade,pl_bmasse,pl_eqt,pl_dens,pl_trandur,pl_insol,
//hostname,st_spectype,st_teff,st_rad,st_mass,st_age,st_vsin,
//sy_dist,sy_snum,sy_mnum,sy_pnum+from+ps+where+disc_year>=2020+and+disc_year<=2024&format=json

class ExoPlanetEntity {
  // Nombre del planeta (usualmente asignado por los descubridores)
  final String planetName;

  // Indica si la existencia del planeta es cuestionada en la literatura (1 = sí, 0 = no)
  final bool isControversial;

  // Año en que se descubrió el planeta
  final int discoveryYear;

  // Método utilizado para descubrir el planeta (e.g., tránsito, velocidad radial)
  final String discoveryMethod;

  // Período orbital del planeta en días
  final double orbitalPeriodDays;

  // Radio del planeta en radios terrestres
  final double radiusEarthRadius;

  // Mejor estimación de la masa del planeta (masas terrestres)
  final double massEarthMass;

  // Temperatura de equilibrio del planeta (Kelvin)
  final double equilibriumTemperature;

  // Densidad del planeta (g/cm³)
  final double density;

  // Duración del tránsito (horas)
  final double transitDurationHours;

  // Flujo de insolación del planeta (flujos terrestres)
  final double insolationFlux;

  ExoPlanetEntity({
    required this.planetName,
    required this.isControversial,
    required this.discoveryYear,
    required this.discoveryMethod,
    required this.orbitalPeriodDays,
    required this.radiusEarthRadius,
    required this.massEarthMass,
    required this.equilibriumTemperature,
    required this.density,
    required this.transitDurationHours,
    required this.insolationFlux,
  });
}
