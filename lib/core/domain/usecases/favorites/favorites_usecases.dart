import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/core/data/models/exoplanet_model.dart';
import 'package:myapp/core/domain/repositories/favorites_repository.dart';

class AddFavorite implements UseCase<void, AddFavoriteParams> {
  final FavoritesRepository repository;

  AddFavorite(this.repository);

  @override
  Future<Either<Failure, void>> call(AddFavoriteParams params) async {
    return await repository.addFavorite(params.id);
  }
}

class AddFavoriteParams {
  final String id;

  AddFavoriteParams({required this.id});
}

class RemoveFavorite implements UseCase<void, RemoveFavoriteParams> {
  final FavoritesRepository repository;

  RemoveFavorite(this.repository);

  @override
  Future<Either<Failure, void>> call(RemoveFavoriteParams params) async {
    return await repository.removeFavorite(params.id);
  }
}

class RemoveFavoriteParams {
  final String id;

  RemoveFavoriteParams({required this.id});
}

class PutFavorites implements UseCase<List<Exoplanet>, NoParams> {
  final FavoritesRepository repository;

  PutFavorites(this.repository);

  @override
  Future<Either<Failure, List<Exoplanet>>> call(NoParams params) async {
    return await repository.putFavoriteExoplanets();
  }
}

class IsFavorite implements UseCase<bool, IsFavoriteParams> {
  final FavoritesRepository repository;

  IsFavorite(this.repository);

  @override
  Future<Either<Failure, bool>> call(IsFavoriteParams params) async {
    return await repository.isFavorite(params.id);
  }
}

class IsFavoriteParams {
  final String id;

  IsFavoriteParams({required this.id});
}

class GetLocalFavorites implements UseCase<List<Exoplanet>, NoParams> {
  final FavoritesRepository repository;

  GetLocalFavorites(this.repository);

  @override
  Future<Either<Failure, List<Exoplanet>>> call(NoParams params) async {
    return await repository.getLocalFavoriteExoplanets();
  }
}
