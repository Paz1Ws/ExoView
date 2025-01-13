import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/presentation/screens/explore/providers/explore_view_providers.dart';
import 'package:myapp/presentation/screens/screens.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class HomeViewController extends ConsumerStatefulWidget {
  const HomeViewController({super.key});

  @override
  ConsumerState<HomeViewController> createState() => _HomeViewControllerState();
}

class _HomeViewControllerState extends ConsumerState<HomeViewController> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;
  final Widget curveOfExoplanets = CurveOfExoplanets();

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      HomeView(
        curveOfExoplanets: curveOfExoplanets,
      ),
      ExploreView(),
      const FavoritesView(),
      const SettingsView(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PurpleBackground(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      withAppBar: false,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          HomeView(curveOfExoplanets: curveOfExoplanets),
          ...pages.sublist(1),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
