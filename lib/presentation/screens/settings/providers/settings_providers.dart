import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:math';

void initializeHive() async {
  await Hive.initFlutter();
  await Hive.openBox<int>('visitedExoplanetsBox');
  await Hive.openBox<String>('userIconBox');
}

class VisitedExoplanetsNotifier extends StateNotifier<int> {
  VisitedExoplanetsNotifier() : super(0) {
    _loadVisitedExoplanetsCount();
  }

  void _loadVisitedExoplanetsCount() {
    final box = Hive.box<int>('visitedExoplanetsBox');
    state = box.get('count', defaultValue: 0) ?? 0;
  }

  void increment() {
    state++;
    final box = Hive.box<int>('visitedExoplanetsBox');
    box.put('count', state);
  }
}

final visitedExoplanetsProvider =
    StateNotifierProvider<VisitedExoplanetsNotifier, int>((ref) {
  return VisitedExoplanetsNotifier();
});

class UserIconNotifier extends StateNotifier<String> {
  UserIconNotifier()
      : super('assets/images/astronauts/orange_female_astronaut.jpeg') {
    _loadUserIcon();
  }

  final List<String> _icons = [
    'assets/images/astronauts/orange_female_astronaut.jpeg',
    'assets/images/astronauts/pink_female_astronaut.jpeg',
    'assets/images/astronauts/red_male_astronaut.jpeg',
    'assets/images/astronauts/yellow_male_astronaut.jpeg',
  ];

  void _loadUserIcon() {
    final box = Hive.box<String>('userIconBox');
    state = box.get('icon', defaultValue: _icons[0]) ?? _icons[0];
  }

  void alternateIcon() {
    final box = Hive.box<String>('userIconBox');
    String newIcon;
    do {
      newIcon = _icons[Random().nextInt(_icons.length)];
    } while (newIcon == state);
    state = newIcon;
    box.put('icon', state);
  }
}

final userIconProvider = StateNotifierProvider<UserIconNotifier, String>((ref) {
  return UserIconNotifier();
});
