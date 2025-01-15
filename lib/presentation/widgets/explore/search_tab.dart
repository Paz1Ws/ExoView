import 'dart:async';

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
  Timer? _debounce;

  void updateFilteredExoplanets(WidgetRef ref) {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      ref.read(isFilteringProvider.notifier).state = false;
      ref.read(canExitProvider.notifier).state = true;
      ref.read(filteredExoplanetsProvider.notifier).state = [];
      return;
    }

    ref.read(isFilteringProvider.notifier).state = true;
    ref.read(canExitProvider.notifier).state = false;

    final cachedExoplanets = ref.read(cachedExoplanetsProvider);
    final filtered = cachedExoplanets.where((exoplanet) {
      return exoplanet.planetName.toLowerCase().contains(query);
    }).toList();

    ref.read(filteredExoplanetsProvider.notifier).state = filtered;
    ref.read(isFilteringProvider.notifier).state = false;
    ref.read(canExitProvider.notifier).state = true;
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      updateFilteredExoplanets(ref);
    });
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WhiteBorderContainer(
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
              mainAxisSize: MainAxisSize.max,
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
                    decoration: BoxDecoration(
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
                        updateFilteredExoplanets(ref);
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
