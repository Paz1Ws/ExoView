import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/core/data/datasources/favorites_data_source.dart';
import 'package:myapp/core/domain/repositories/favorites_repository.dart';
import 'package:myapp/config/failures/failures.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesRemoteDataSource remoteDataSource;
  FavoritesRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> addFavorite(Exoplanet exoplanet) async {
    try {
      await remoteDataSource.addFavorite(exoplanet);
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
  Future<Either<Failure, void>> addFavoriteExoplanetstoLocal(
      Exoplanet exoplanet) async {
    try {
      final result =
          await remoteDataSource.addExoplanetFavoritestoLocal(exoplanet);
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
  Future<Either<Failure, List<Exoplanet>>> getFavorites() async {
    try {
      final favorites = await remoteDataSource.getFavorites();
      return Right(favorites);
    } catch (e) {
      return Left(Failure('Failed to fetch favorites: $e'));
    }
  }

  Future<Either<Failure, void>> syncFavorites() async {
    try {
      final remoteFavorites = await remoteDataSource.getFavorites();
      final localFavoritesResult =
          await remoteDataSource.getLocalFavoriteExoplanets();

      return localFavoritesResult.fold(
        (failure) => Left(failure),
        (localFavorites) async {
          // Replace local favorites with remote favorites
          await remoteDataSource.box.put('favoriteExoplanets',
              remoteFavorites.map((e) => e.toJson()).toList());
          return const Right(null);
        },
      );
    } catch (e) {
      return Left(Failure('Failed to sync favorites: $e'));
    }
  }
}
