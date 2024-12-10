import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/config.dart';
import 'package:myapp/core/data/data.dart';
import 'package:hive/hive.dart';
import 'package:myapp/config/failures/failures.dart';

abstract interface class ExoplanetLocalDataSource {
  Future<Either<Failure, List<Exoplanet>>> getLocalExoplanets();
  void storeExoplanets(List<Exoplanet> exoplanets);
  Future<void> getRemoteExoplanets();
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
  Future<void> storeExoplanets(List<Exoplanet> exoplanets) async {
    await Future(() async {
      final existingExoplanets = box.get('exoplanets') as List<dynamic>? ?? [];
      final existingExoplanetIds = existingExoplanets
          .map((e) => Exoplanet.fromJson(Map<String, dynamic>.from(e as Map))
              .planetName)
          .toSet();

      final newExoplanets = <Map<String, dynamic>>[];
      for (var exoplanet in exoplanets) {
        if (!existingExoplanetIds.contains(exoplanet.planetName)) {
          newExoplanets.add(exoplanet.toJson());
          existingExoplanetIds.add(exoplanet.planetName);
        }
      }

      existingExoplanets.addAll(newExoplanets);
      await box.put('exoplanets', existingExoplanets);
    });
  }
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

