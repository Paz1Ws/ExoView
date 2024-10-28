

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/theme/colors.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/presentation/screens/explore/providers/explore_view_providers.dart';
import 'package:myapp/presentation/screens/home/providers/exoplanet_providers.dart';
import 'package:myapp/presentation/widgets/widgets.dart';
void showFilterModal(BuildContext context, WidgetRef ref) {
  final exoplanets = ref.watch(localExoplanetsProvider);

  final List<String> exoplanetCategories = [
    'All Exoplanets',
    'Super Earths',
    'Water Worlds',
    'Rocky Planets',
    'Gas Giants',
    'Neptunians',
  ];

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return exoplanets.when(
        data: (data) {
          return data.fold(
            (failure) => Center(child: Text('Error: ${failure.message}')),
            (exoplanets) {
              return Container(
                padding: const EdgeInsets.all(18),
                color: AppColors.veryDarkPurple,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Filter By',
                            style: TextStyle(color: Colors.white),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                      ...exoplanetCategories.map((category) {
                        return ListTile(
                            title: Text(
                              category,
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              // Aquí puedes hacer una consulta personalizada
                              //   final filteredExoplanets = _filterExoplanetsByCategory(exoplanets, category);
                              //   // Mostrar los exoplanetas filtrados
                              //   Navigator.pop(context);
                              //   _showFilteredExoplanets(context, filteredExoplanets);
                              //
                            });
                      }).toList(),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.transparent,
          ),
        ),
        error: (error, stack) => Center(child: Text('Error: $error')),
      );
    },
  );
}