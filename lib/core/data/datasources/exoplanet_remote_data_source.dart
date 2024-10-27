import 'dart:convert';
import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/config.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/core/data/data.dart';

abstract interface class ExoplanetRemoteDataSource {
  Future<Either<Failure, List<Exoplanet>>> getExoplanets(String? url);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDate(
      DateTime exoDate);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDensity(
      double minDensity, double maxDensity);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDiscoveryMethod(
      String exoDiscoveryMethod);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDiscoveryYear(
      double minYear, double maxYear);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDistance(
      double minDist, double maxDist);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByMass(double exoMass);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByName(String exoName);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByTemperature(
      double minTemperature, double maxTemperature);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByType(String exoType);
  Future<Either<Failure, void>> addExoplanetToFavorites();
  Future<Either<Failure, void>> removeExoplanetFromFavorites(String id);
}

class ExoplanetRemoteDataSourceImpl implements ExoplanetRemoteDataSource {
  @override
  Future<Either<Failure, List<Exoplanet>>> getExoplanets(
      String? externalUrl) async {
    final url = externalUrl == null ? AppSecrets.baseExoplanetUrl : externalUrl;
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Exoplanet> exoplanets =
            data.map((json) => Exoplanet.fromJson(json)).toList();
        return Right(exoplanets);
      } else {
        return Left(
            Failure('Error fetching exoplanets: ${response.statusCode}'));
      }
    } on SocketException {
      return Left(Failure('No Internet connection'));
    } on FormatException {
      return Left(Failure('Bad response format'));
    } on HttpException {
      return Left(Failure('Unexpected HTTP error'));
    } catch (e) {
      return Left(Failure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDate(
      DateTime exoDate) async {
    final year = exoDate.year;
    final url =
        'https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=select+pl_name,pl_controv_flag,disc_year,discoverymethod,pl_orbper,pl_rade,pl_bmasse,pl_eqt,pl_dens,pl_trandur,pl_insol,hostname,st_spectype,st_teff,st_rad,st_mass,st_age,st_vsin,sy_dist,sy_snum,sy_mnum,sy_pnum+from+ps+where+disc_year=$year&format=json';
    return getExoplanets(url);
  }

  @override
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDensity(
      double minDensity, double maxDensity) async {
    final url =
        'https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=select+pl_name,pl_controv_flag,disc_year,discoverymethod,pl_orbper,pl_rade,pl_bmasse,pl_eqt,pl_dens,pl_trandur,pl_insol,hostname,st_spectype,st_teff,st_rad,st_mass,st_age,st_vsin,sy_dist,sy_snum,sy_mnum,sy_pnum+from+ps+where+pl_dens>=$minDensity+and+pl_dens<=$maxDensity&format=json';
    return getExoplanets(url);
  }

  @override
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDiscoveryMethod(
      String exoDiscoveryMethod) async {
    final url =
        'https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=select+pl_name,pl_controv_flag,disc_year,discoverymethod,pl_orbper,pl_rade,pl_bmasse,pl_eqt,pl_dens,pl_trandur,pl_insol,hostname,st_spectype,st_teff,st_rad,st_mass,st_age,st_vsin,sy_dist,sy_snum,sy_mnum,sy_pnum+from+ps+where+discovermethod=$exoDiscoveryMethod&format=json';
    return getExoplanets(url);
  }

  @override
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDiscoveryYear(
      double minYear, double maxYear) async {
    final url =
        'https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=select+pl_name,pl_controv_flag,disc_year,discoverymethod,pl_orbper,pl_rade,pl_bmasse,pl_eqt,pl_dens,pl_trandur,pl_insol,hostname,st_spectype,st_teff,st_rad,st_mass,st_age,st_vsin,sy_dist,sy_snum,sy_mnum,sy_pnum+from+ps+where+disc_year>=$minYear+and+pl_dens<=$maxYear&format=json';
    return getExoplanets(url);
  }

  @override
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDistance(
      double minDist, double maxDist) async {
    final url =
        'https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=select+pl_name,pl_controv_flag,disc_year,discoverymethod,pl_orbper,pl_rade,pl_bmasse,pl_eqt,pl_dens,pl_trandur,pl_insol,hostname,st_spectype,st_teff,st_rad,st_mass,st_age,st_vsin,sy_dist,sy_snum,sy_mnum,sy_pnum+from+ps+where+sy_dist>=$minDist&<=$maxDist&format=json';
    return getExoplanets(url);
  }

  @override
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByMass(
      double exoMass) async {
    final url =
        'https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=select+pl_name,pl_controv_flag,disc_year,discoverymethod,pl_orbper,pl_rade,pl_bmasse,pl_eqt,pl_dens,pl_trandur,pl_insol,hostname,st_spectype,st_teff,st_rad,st_mass,st_age,st_vsin,sy_dist,sy_snum,sy_mnum,sy_pnum+from+ps+where+pl_bmasse=$exoMass&format=json';
    return getExoplanets(url);
  }

  @override
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByName(
      String exoName) async {
    final url =
        'https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=select+pl_name,pl_controv_flag,disc_year,discoverymethod,pl_orbper,pl_rade,pl_bmasse,pl_eqt,pl_dens,pl_trandur,pl_insol,hostname,st_spectype,st_teff,st_rad,st_mass,st_age,st_vsin,sy_dist,sy_snum,sy_mnum,sy_pnum+from+ps+where+pl_name=$exoName&format=json';
    return getExoplanets(url);
  }

  @override
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByTemperature(
      double minTemperature, double maxTemperature) async {
    final url =
        'https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=select+pl_name,pl_controv_flag,disc_year,discoverymethod,pl_orbper,pl_rade,pl_bmasse,pl_eqt,pl_dens,pl_trandur,pl_insol,hostname,st_spectype,st_teff,st_rad,st_mass,st_age,st_vsin,sy_dist,sy_snum,sy_mnum,sy_pnum+from+ps+where+disc_year>=$minTemperature+and+pl_dens<=$maxTemperature&format=json';
    return getExoplanets(url);
  }

  @override
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByType(
      String exoType) async {
    final url =
        'https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=select+pl_name,pl_controv_flag,disc_year,discoverymethod,pl_orbper,pl_rade,pl_bmasse,pl_eqt,pl_dens,pl_trandur,pl_insol,hostname,st_spectype,st_teff,st_rad,st_mass,st_age,st_vsin,sy_dist,sy_snum,sy_mnum,sy_pnum+from+ps&format=json';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Exoplanet?> exoplanets = data
            .map((json) {
              final exoplanet = Exoplanet.fromJson(json);
              final type = classifyExoplanet(
                  exoplanet.massEarthMass, exoplanet.radiusEarthRadius);
              return type == exoType ? exoplanet : null;
            })
            .where((exoplanet) => exoplanet != null)
            .toList();
        return Right(exoplanets);
      } else {
        return Left(
            Failure('Error fetching exoplanets: ${response.statusCode}'));
      }
    } catch (e) {
      return Left(Failure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> addExoplanetToFavorites() {
    // TODO: implement addExoplanetToFavorites
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> removeExoplanetFromFavorites(String id) {
    // TODO: implement removeExoplanetFromFavorites
    throw UnimplementedError();
  }
}

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
