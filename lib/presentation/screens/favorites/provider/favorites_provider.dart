// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:myapp/core/data/repositories/favorites_repository_impl.dart';
// import 'package:myapp/core/domain/repositories/favorites_repository.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:hive/hive.dart';

// final favoritesRepositoryProvider = Provider<FavoritesRepository>((ref) {
//   final supabaseClient = ref.read(supabaseClientProvider);
//   final box = ref.read(hiveBoxProvider);
//   return FavoritesRepositoryImpl(supabaseClient, box);
// });