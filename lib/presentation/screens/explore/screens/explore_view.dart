import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/screens/explore/providers/explore_view_providers.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class ExploreView extends ConsumerStatefulWidget {
  final List<String> exoplanetCategories = [
    'All Exoplanets',
    'Super Earths',
    'Water Worlds',
    'Rocky Planets',
    'Gas Giants',
    'Neptunians',
  ];
  ExploreView({super.key});

  @override
  ConsumerState<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends ConsumerState<ExploreView> {
  Timer? _timer;
  final ScrollController _scrollController = ScrollController();
  int _loadedItems = 10;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    _scrollController.addListener(_onScroll);

    // Load cached exoplanets data
    ref.read(loadCachedExoplanetsProvider);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        if (_loadedItems < ref.read(filteredExoplanetsProvider).length) {
          _loadedItems += 10;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cachedExoplanets = ref.watch(cachedExoplanetsProvider);
    final isLoading = cachedExoplanets.isEmpty;

    return WillPopScope(
      onWillPop: () async => ref.watch(canExitProvider),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SearchTab(),
            const SizedBox(
              height: 20,
            ),
            isLoading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 20),
                      Text(
                        'Cargando data...',
                        style: AppFonts.spaceGrotesk16,
                      ),
                    ],
                  )
                : ref.watch(filteredExoplanetsProvider).isNotEmpty
                    ? Expanded(
                        child: GridView.builder(
                          controller: _scrollController,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: _loadedItems <
                                  ref.watch(filteredExoplanetsProvider).length
                              ? _loadedItems
                              : ref.watch(filteredExoplanetsProvider).length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: TouchableExoplanetCard(
                                exoplanet: ref
                                    .watch(filteredExoplanetsProvider)[index],
                              ),
                            );
                          },
                        ),
                      )
                    : Expanded(
                        child: Column(
                          children: [
                            Spacer(),
                            Center(
                              child: AnimatedTextKit(
                                totalRepeatCount: 1,
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    'Looking for a new home?',
                                    speed: const Duration(milliseconds: 200),
                                    textAlign: TextAlign.center,
                                    textStyle: AppFonts.spaceGrotesk40.copyWith(
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.lightGray),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
