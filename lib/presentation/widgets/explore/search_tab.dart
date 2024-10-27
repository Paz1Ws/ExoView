import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/config.dart';
import 'package:myapp/config/theme/colors.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/core/data/repositories/exoplanet_local_storage_impl.dart';
import 'package:myapp/presentation/screens/explore/providers/explore_view_providers.dart';
import 'package:myapp/presentation/screens/screens.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

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
    final rangeValues = ref.watch(discoverYearProvider(widget.exoplanets));
    final rangeNotifier =
        ref.read(discoverYearProvider(widget.exoplanets).notifier);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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
          min: rangeValues.start,
          max: rangeValues.end,
          activeColor: AppColors.brightPurple,
          inactiveColor: AppColors.lightGray,
          values: rangeValues,
          divisions: 3,
          onChanged: (RangeValues values) {
            rangeNotifier.updateRange(values);
          },
        ),
      ],
    );
  }
}
