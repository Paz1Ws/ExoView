import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/config.dart';
import 'package:myapp/config/theme/colors.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/presentation/screens/screens.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

import '../../screens/explore/providers/explore_view_providers.dart';
import '../../screens/home/providers/exoplanet_providers.dart';

class SearchTab extends ConsumerWidget {
  const SearchTab({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return WhiteBorderContainer(
        border: 6,
        width: double.infinity,
        widget: Container(
            decoration: BoxDecoration(
              color: AppColors.veryDarkPurple,
              borderRadius: BorderRadius.circular(6),
            ),
            height: 50,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        icon: const Icon(Icons.search),
                        hintText: 'Search...',
                        hintStyle: AppFonts.spaceGrotesk16,
                        border: InputBorder.none,
                      ),
                      style: AppFonts.spaceGrotesk16,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(
                      Icons.tune,
                      color: AppColors.lightGray,
                    ),
                    onPressed: () {
                      _showFilterModal(context, ref);
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.brightTealGreen,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.mic),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            )));
  }
}

void _showFilterModal(BuildContext context, WidgetRef ref) {
  final exoplanets = ref.watch(exoplanetsProvider);
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
        return FutureBuilder<Either<Failure, List<Exoplanet>>>(
          future: exoplanets,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
              ));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
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
                          Row(
                            children: [
                              Text(
                                'Filter By',
                                style: AppFonts.spaceGrotesk16.copyWith(
                                  color: AppColors.lightGray,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.tune,
                                  color: AppColors.lightGray,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.check),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Exoplanet Type',
                        style: AppFonts.spaceGrotesk16.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 150,
                        width: double.infinity,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: 6,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 20,
                          ),
                          itemBuilder: (context, index) {
                            return PlanetCategoryCard(
                              exoplanetCategory: exoplanetCategories[index],
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ExploreSectionDetails(
                                    exoplanets: snapshot.data!.fold(
                                      (failure) => [],
                                      (exoplanets) => exoplanets,
                                    ),
                                    section: exoplanetCategories[index],
                                  ),
                                ));
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FilterSection(
                        exoplanets: snapshot.data!.fold(
                          (failure) => [],
                          (exoplanets) => exoplanets,
                        ),
                        text: 'Discovery Year',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Distance from Earth (light years)',
                        style: AppFonts.spaceGrotesk16.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RangeSlider(
                        activeColor: AppColors.brightPurple,
                        values: const RangeValues(0, 100),
                        onChanged: (RangeValues values) {},
                        min: 0,
                        max: 100,
                        divisions: 100,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Mass, compared to Earth',
                        style: AppFonts.spaceGrotesk16.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RangeSlider(
                        activeColor: AppColors.brightPurple,
                        values: const RangeValues(0, 100),
                        onChanged: (RangeValues values) {},
                        min: 0,
                        max: 100,
                        divisions: 100,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Density, compared to Earth',
                        style: AppFonts.spaceGrotesk16.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RangeSlider(
                        activeColor: AppColors.brightPurple,
                        values: const RangeValues(0, 100),
                        onChanged: (RangeValues values) {},
                        min: 0,
                        max: 100,
                        divisions: 100,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        );
      });
}

class FilterSection extends ConsumerStatefulWidget {
  final String text;
  final List<Exoplanet> exoplanets;
  const FilterSection({
    required this.text,
    required this.exoplanets,
    super.key,
  });

  @override
  ConsumerState<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends ConsumerState<FilterSection> {
  @override
  Widget build(BuildContext context) {
    double minYear = 10.0;
    double maxYear = 1000.0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: AppFonts.spaceGrotesk16.copyWith(
            color: AppColors.white,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        RangeSlider(
           min: minYear,
          max: maxYear,
          activeColor: AppColors.brightPurple,
          inactiveColor: AppColors.lightGray,
       values: RangeValues(minYear, maxYear),
          divisions: 5,
          onChanged: (RangeValues vals) {
            setState(() {
              minYear = vals.start;
              maxYear = vals.end;
              print(maxYear);
              print(minYear);
            });
          },
         
        ),
      ],
    );
  }
}
