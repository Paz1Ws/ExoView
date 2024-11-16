import 'package:fpdart/fpdart.dart';

import 'package:myapp/config/config.dart';
import 'package:myapp/core/data/data.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/core/domain/domain.dart';

abstract interface class ExoplanetLocalDataSource {
  Future<Either<Failure, List<Exoplanet>>> getLocalExoplanets();
  // Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDate(
  //     DateTime exoDate);
  // Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDensity(
  //     double minDensity, double maxDensity);
  // Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDiscoveryMethod(
  //     String exoDiscoveryMethod);
  // Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDiscoveryYear(
  //     double minYear, double maxYear);
  // Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDistance(
  //     double minDist, double maxDist);
  // Future<Either<Failure, List<Exoplanet?>>> getExoplanetByMass(double exoMass);
  // Future<Either<Failure, List<Exoplanet?>>> getExoplanetByName(String exoName);
  // Future<Either<Failure, List<Exoplanet?>>> getExoplanetByTemperature(
  //     double minTemperature, double maxTemperature);
  // Future<Either<Failure, List<Exoplanet?>>> getExoplanetByType(String exoType);
  // Future<Either<Failure, void>> addExoplanetToFavorites();
  // Future<Either<Failure, void>> removeExoplanetFromFavorites(String id);
  void storeExoplanets(List<Exoplanet> exoplanets);
  void getRemoteExoplanets();
}

class ExoplanetLocalDataSourceImpl implements ExoplanetLocalDataSource {
  final ExoplanetRemoteDataSource remoteDataSource;
  final Box box;

  ExoplanetLocalDataSourceImpl(this.box, this.remoteDataSource);

  @override
  Future<void> getRemoteExoplanets() async {
    int startYear = 1995;
    int currentYear = DateTime.now().year;

    while (startYear <= currentYear) {
      final exoplanets =
          await remoteDataSource.getExoplanets(startYear, currentYear);
      exoplanets.fold(
        (failure) => print('Error fetching exoplanets: $failure'),
        (exoplanets) async {
          storeExoplanets(exoplanets);
          startYear++;
        },
      );
    }
  }

  @override
  Future<Either<Failure, List<Exoplanet>>> getLocalExoplanets() async {
    try {
      final exoplanetList = box.get('exoplanets') as List<dynamic>?;
      if (exoplanetList == null) {
        return Left(Failure('No exoplanets found'));
      }
      final exoplanets = exoplanetList.map((e) {
        final map = Map<String, dynamic>.from(e as Map);
        return Exoplanet.fromJson(map);
      }).toList();
      return Right(exoplanets);
    } catch (e) {
      return Left(Failure('Failed to get local exoplanets'));
    }
  }

  @override
  void storeExoplanets(List<Exoplanet> exoplanets) {
    final existingExoplanets = box.get('exoplanets') as List<dynamic>? ?? [];
    final exoplanetList = exoplanets.map((e) => e.toJson()).toList();
    existingExoplanets.addAll(exoplanetList);
    box.put('exoplanets', existingExoplanets);
  }
  // @override
  // Future<Either<Failure, List<Exoplanet?>>> getExoplanetByType(
  //     String exoType) async {
  //   final url =
  //       'https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=select+pl_name,pl_controv_flag,disc_year,discoverymethod,pl_orbper,pl_rade,pl_bmasse,pl_eqt,pl_dens,pl_trandur,pl_insol,hostname,st_spectype,st_teff,st_rad,st_mass,st_age,st_vsin,sy_dist,sy_snum,sy_mnum,sy_pnum+from+ps&format=json';

  //   try {
  //     final response = await http.get(Uri.parse(url));

  //     if (response.statusCode == 200) {
  //       final List<dynamic> data = json.decode(response.body);
  //       final List<Exoplanet?> exoplanets = data
  //           .map((json) {
  //             final exoplanet = Exoplanet.fromJson(json);
  //             final type = classifyExoplanet(
  //                 exoplanet.massEarthMass, exoplanet.radiusEarthRadius);
  //             return type == exoType ? exoplanet : null;
  //           })
  //           .where((exoplanet) => exoplanet != null)
  //           .toList();
  //       return Right(exoplanets);
  //     } else {
  //       return Left(
  //           Failure('Error fetching exoplanets: ${response.statusCode}'));
  //     }
  //   } catch (e) {
  //     return Left(Failure('Unexpected error: $e'));
  //   }
  // }
}
