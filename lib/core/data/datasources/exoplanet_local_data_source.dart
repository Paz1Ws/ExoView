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
    int startYear = box.get('lastFetchedYear', defaultValue: 1995);
    int currentYear = DateTime.now().year;

    while (startYear <= currentYear) {
      final exoplanets =
          await remoteDataSource.getExoplanets(startYear, currentYear);
      exoplanets.fold(
        (failure) => print('Error fetching exoplanets: $failure'),
        (exoplanets) async {
          storeExoplanets(exoplanets);
          startYear++;
          await box.put('lastFetchedYear', startYear);
        },
      );
    }
  }

  @override
  Future<Either<Failure, List<Exoplanet>>> getLocalExoplanets() async {
    try {
      final exoplanetList = box.get('exoplanets') as List<dynamic>? ?? [];
      final exoplanets = exoplanetList.map((e) {
        final map = Map<String, dynamic>.from(e as Map);
        return Exoplanet.fromJson(map, map['id']);
      }).toList();
      return Right(exoplanets);
    } catch (e) {
      return Left(Failure('Failed to get local exoplanets'));
    }
  }

  @override
  Future<void> storeExoplanets(List<Exoplanet> exoplanets) async {
    final existingExoplanets = box.get('exoplanets') as List<dynamic>? ?? [];
    final existingExoplanetIds =
        existingExoplanets.map((e) => (e as Map)['pl_name'] as String).toSet();

    final newExoplanets = <Map<String, dynamic>>[];
    for (var exoplanet in exoplanets) {
      if (!existingExoplanetIds.contains(exoplanet.planetName)) {
        newExoplanets.add(exoplanet.toJson());
        existingExoplanetIds.add(exoplanet.planetName);
      }
    }

    existingExoplanets.addAll(newExoplanets);
    await box.put('exoplanets', existingExoplanets);
  }
}
