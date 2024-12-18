import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/core/data/datasources/favorites_data_source.dart';
import 'package:myapp/core/domain/repositories/favorites_repository.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesRemoteDataSource remoteDataSource;
  FavoritesRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> addFavorite(String id, String name) async {
    try {
      await remoteDataSource.addFavorite(id, name);
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
      String id, String name) async {
    try {
      final result =
          await remoteDataSource.addExoplanetFavoritestoLocal(id, name);
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
  Future<PostgrestMap> getFavorites() async {
    try {
      final favorites = await remoteDataSource.getFavorites();
      return favorites;
    } catch (e) {
      throw Exception('Failed to fetch favorites: $e');
    
    }
  }
}
