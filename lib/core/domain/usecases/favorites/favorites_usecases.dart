import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/core/data/data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddFavorite implements UseCase<void, AddFavoriteParams> {
  final FavoritesRepositoryImpl repository;

  AddFavorite(this.repository);

  @override
  Future<Either<Failure, void>> call(AddFavoriteParams params) async {
    return await repository.addFavorite(params.id, params.name);
  }
}

class AddFavoritesToLocal implements UseCase<void, AddFavoriteParams> {
  final FavoritesRepositoryImpl repository;

  AddFavoritesToLocal(this.repository);

  @override
  Future<Either<Failure, void>> call(AddFavoriteParams params) async {
    return await repository.addFavoriteExoplanetstoLocal(
        params.id, params.name);
  }
}

class AddFavoriteParams {
  final String id;

  final String name;
  AddFavoriteParams({required this.id, required this.name});
}

class RemoveFavorite implements UseCase<void, RemoveFavoriteParams> {
  final FavoritesRepositoryImpl repository;

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

class IsFavorite implements UseCase<bool, IsFavoriteParams> {
  final FavoritesRepositoryImpl repository;

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
  final FavoritesRepositoryImpl repository;

  GetLocalFavorites(this.repository);

  @override
  Future<Either<Failure, List<Exoplanet>>> call(NoParams params) async {
    return  await repository.getLocalFavoriteExoplanets();
  }
}
