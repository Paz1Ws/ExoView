import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/theme/colors.dart';
import 'package:myapp/presentation/screens/home/providers/exoplanet_providers.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

void showFilterModal(BuildContext context, WidgetRef ref) {
  final List<String> exoplanetCategories = [
    'All Exoplanets',
    'Super Earths',
    'Water Worlds',
    'Rocky Planets',
    'Gas Giants',
    'Neptunians',
  ];
  final List<String> exoplanetFilters = [
    'Date of Discovery',
    'Mass of Exoplanet',
    'Radius of Exoplanet',
    'Orbital Period',
    // 'Is of Controversial Origin?',
    // 'Discovery Method',
    'Equilibrium Temperature',
    'Density',
    'Transit Duration',
    'Insolation Flux'
  ];

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return FutureBuilder(
        future: ref.refresh(localExoplanetsProvider.future),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pop();
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  final data = snapshot.data;
                  return data!.fold(
                    (failure) => Center(
                      child: CircularProgressIndicator(),
                    ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Filter By',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  IconButton(
                                    icon:
                                        Icon(Icons.close, color: Colors.white),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height / 5,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children:
                                        exoplanetCategories.map((category) {
                                      return Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                2.5,
                                        height:
                                            MediaQuery.sizeOf(context).height /
                                                5,
                                        child: PlanetCategoryCard(
                                          exoplanetCategory: category,
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              ...exoplanetFilters.map((filter) {
                                return FilterSection(
                                  text: filter,
                                  exoplanets: exoplanets,
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            });
            return Container();
          }
        },
      );
    },
  );
}
