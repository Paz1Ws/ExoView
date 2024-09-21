import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/screens/screens.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class HomeViewController extends StatefulWidget {
  HomeViewController({super.key});

  @override
  State<HomeViewController> createState() => _HomeViewControllerState();
}

class _HomeViewControllerState extends State<HomeViewController> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;
  final List<Widget> pages = [
    HomeView(),
    ExoplanetDetails(),
    SpaceShipView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PurpleBackground(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      padding: _pageController.hasClients
          ? EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
              top: _pageController.page == 0 ? 40 : 20,
            )
          : null,
      withAppBar: false,
      body: PageView(
        allowImplicitScrolling: true,
        controller: _pageController,
        children: pages,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
