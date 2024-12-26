import 'package:myapp/core/data/data.dart';
import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class FavoritesRepository {
  Future<Either<Failure, void>> addFavorite(Exoplanet exoplanet);
  Future<Either<Failure, void>> removeFavorite(String id);
  Future<Either<Failure, bool>> isFavorite(String id);
  Future<Either<Failure, List<Exoplanet>>> getFavorites();
  Future<Either<Failure, List<Exoplanet>>> getLocalFavoriteExoplanets();
}
