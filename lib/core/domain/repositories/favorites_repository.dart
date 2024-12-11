import 'package:myapp/core/data/data.dart';
import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/config.dart';

abstract interface class FavoritesRepository {
  Future<Either<Failure, void>> addFavorite(String id);
  Future<Either<Failure, void>> removeFavorite(String id);
  Future<List<Exoplanet>> getFavorites();
  Future<Either<Failure, bool>> isFavorite(String id);
  Future<Either<Failure, List<Exoplanet>>> putFavoriteExoplanets();
  Future<Either<Failure, List<Exoplanet>>> getLocalFavoriteExoplanets();
}
