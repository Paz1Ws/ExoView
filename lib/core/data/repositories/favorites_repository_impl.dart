import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/core/data/datasources/favorites_data_source.dart';
import 'package:myapp/core/domain/repositories/favorites_repository.dart';
import 'package:myapp/config/failures/failures.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesRemoteDataSource remoteDataSource;
  FavoritesRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> addFavorite(String id) async {
    try {
      await remoteDataSource.addFavorite(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure('Failed to add favorite: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> removeFavorite(String id) async {
    try {
      await remoteDataSource.removeFavorite(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure('Failed to remove favorite: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Exoplanet>>> getLocalFavoriteExoplanets() async {
    try {
      final favorites = await remoteDataSource.getLocalFavoriteExoplanets();
      return favorites;
    } catch (e) {
      return Left(Failure('Failed to fetch local favorites: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Exoplanet>>> putFavoriteExoplanets() async {
    try {
      final result = await remoteDataSource.putFavoriteExoplanets();
      return result;
    } catch (e) {
      return Left(Failure('Failed to put favorite exoplanets: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> isFavorite(String id) async {
    try {
      final isFavorite = await remoteDataSource.isFavorite(id);
      return Right(isFavorite);
    } catch (e) {
      return Left(Failure('Failed to check favorite: $e'));
    }
  }

  @override
  Future<List<Exoplanet>> getFavorites() {
    return remoteDataSource.getFavorites();
  }
}
