import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/theme/colors.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:myapp/presentation/screens/explore/providers/explore_view_providers.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class SearchTab extends ConsumerStatefulWidget {
  SearchTab({super.key});

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends ConsumerState<SearchTab> {
  final TextEditingController searchController = TextEditingController();

  void updateFilteredExoplanets(WidgetRef ref) {
    final query = searchController.text.toLowerCase();
    final exoplanets = ref.read(filteredExoplanets);

    final newFilteredExoplanets = exoplanets.where((exoplanet) {
      return exoplanet.planetName.toLowerCase().contains(query) ||
          exoplanet.discoveryYear.toString().toLowerCase().contains(query) ||
          exoplanet.equilibriumTemperature
              .toString()
              .toLowerCase()
              .contains(query);
    }).toList();

    ref.read(filteredExoplanets.notifier).state = newFilteredExoplanets;
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      updateFilteredExoplanets(ref);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  controller: searchController,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.search),
                    hintText: 'Search...',
                    hintStyle: AppFonts.spaceGrotesk16,
                    border: InputBorder.none,
                  ),
                  style: AppFonts.spaceGrotesk16,
                  onChanged: (value) {
                    updateFilteredExoplanets(ref);
                  },
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
                  showFilterModal(context, ref);
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
                  icon: const Icon(Icons.check),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
