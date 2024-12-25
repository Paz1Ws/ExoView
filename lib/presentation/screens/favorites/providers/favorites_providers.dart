import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/core/domain/usecases/favorites/favorites_usecases.dart';
import 'package:myapp/init_dependencies.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_providers.g.dart';

// Repositorio de Favoritos
@riverpod
FavoritesRepositoryImpl favoritesRepository(FavoritesRepositoryRef ref) {
  return serviceLocator<FavoritesRepositoryImpl>();
}

// Use Cases
@riverpod
AddFavorite addFavoriteUseCase(AddFavoriteUseCaseRef ref) {
  final repository = ref.watch(favoritesRepositoryProvider);
  return AddFavorite(repository);
}

@riverpod
AddFavoritesToLocal addFavoritesToLocal(AddFavoritesToLocalRef ref) {
  final repository = ref.watch(favoritesRepositoryProvider);
  return AddFavoritesToLocal(repository);
}

@riverpod
RemoveFavorite removeFavoriteUseCase(RemoveFavoriteUseCaseRef ref) {
  final repository = ref.watch(favoritesRepositoryProvider);
  return RemoveFavorite(repository);
}

@riverpod
IsFavorite isFavoriteUseCase(IsFavoriteUseCaseRef ref) {
  final repository = ref.watch(favoritesRepositoryProvider);
  return IsFavorite(repository);
}



@riverpod
GetLocalFavorites getLocalFavoritesUseCase(GetLocalFavoritesUseCaseRef ref) {
  final repository = ref.watch(favoritesRepositoryProvider);
  return GetLocalFavorites(repository);
}

@riverpod
GetFavoritesWithFallback getFavoritesWithFallbackUseCase(ref) {
  final repository = ref.watch(favoritesRepositoryProvider);
  return GetFavoritesWithFallback(repository);
}

// Providers para interactuar con los Use Cases
@riverpod
Future<Either<Failure, void>> addFavorite(
    AddFavoriteRef ref, AddFavoriteParams params) async {
  final useCase = ref.watch(addFavoriteUseCaseProvider);
  return await useCase(params);
}

@riverpod
Future<Either<Failure, void>> saveFavoritesLocally(
    SaveFavoritesLocallyRef ref, AddFavoriteParams params) async {
  final useCase = ref.watch(addFavoritesToLocalProvider);
  return await useCase(params);
}

@riverpod
Future<Either<Failure, void>> removeFavorite(
    RemoveFavoriteRef ref, RemoveFavoriteParams params) async {
  final useCase = ref.watch(removeFavoriteUseCaseProvider);
  return await useCase(params);
}

@riverpod
Future<Either<Failure, bool>> isFavorite(
    IsFavoriteRef ref, IsFavoriteParams params) async {
  final useCase = ref.watch(isFavoriteUseCaseProvider);
  return await useCase(params);
}

@riverpod
Future<Either<Failure, dynamic>> getLocalFavorites(
    GetLocalFavoritesRef ref, NoParams params) async {
  final useCase = ref.watch(getLocalFavoritesUseCaseProvider);
  return await useCase(params);
}
