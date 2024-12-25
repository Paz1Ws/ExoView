import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/core/domain/usecases/favorites/favorites_usecases.dart';
import 'package:myapp/presentation/screens/favorites/providers/favorites_providers.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class ExoplanetOrShipDetails extends ConsumerStatefulWidget {
  final Exoplanet? exoplanet;
  final String? model3D;
  final bool isShip;
  final List<String> defaultPlanets = [
    'assets/images/planet_icons/planet_icon_1.png',
    'assets/images/planet_icons/planet_icon_2.png',
    'assets/images/planet_icons/planet_icon_3.png',
    'assets/images/planet_icons/planet_icon_4.png',
    'assets/images/planet_icons/planet_icon_5.png',
  ];
  final List<ChartData> chartData = [
    ChartData(5, AppColors.softPurple),
    ChartData(15, AppColors.purple),
    ChartData(25, AppColors.brightPurple),
    ChartData(55, const Color.fromARGB(255, 55, 29, 76))
  ];

  ExoplanetOrShipDetails({
    super.key,
    this.exoplanet,
    this.model3D,
    this.isShip = false,
  });

  @override
  _ExoplanetOrShipDetailsState createState() => _ExoplanetOrShipDetailsState();
}

class _ExoplanetOrShipDetailsState
    extends ConsumerState<ExoplanetOrShipDetails> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    final result = await ref.read(isFavoriteProvider(
            IsFavoriteParams(id: widget.exoplanet!.id.toString()))
        .future);
    result.fold(
      (failure) => setState(() => isFavorite = false),
      (favorite) => setState(() => isFavorite = favorite),
    );
  }

  Future<void> _toggleFavorite() async {
    if (isFavorite) {
      final result = await ref.read(removeFavoriteProvider(
              RemoveFavoriteParams(id: widget.exoplanet!.id.toString()))
          .future);

      result.fold(
        (failure) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to remove favorite: $failure')),
        ),
        (_) => setState(() => isFavorite = false),
      );
    } else {
      final result = await ref.read(
          addFavoriteProvider(AddFavoriteParams(exoplanet: widget.exoplanet!))
              .future);
      await ref.read(saveFavoritesLocallyProvider(
          AddFavoriteParams(exoplanet: widget.exoplanet!)));
      result.fold(
        (failure) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add favorite: $failure')),
        ),
        (_) => setState(() => isFavorite = true),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return PurpleBackground(
      withNavigation: false,
      withAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.4,
              width: size.width,
              child: PlanetAndChart(
                  model3D: widget.model3D,
                  size: size,
                  defaultPlanets: widget.defaultPlanets,
                  chartData: widget.chartData,
                  isShip: widget.isShip,
                  exoplanet: widget.exoplanet!),
            ),
            Column(
              children: [
                Container(
                  color: AppColors.brightPurple,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.isShip
                            ? 'Nebula Voyager'
                            : widget.exoplanet!.planetName,
                        style: AppFonts.spaceGrotesk18,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.lightGray,
                          ),
                        ),
                        child: Text(
                          widget.isShip
                              ? '2020'
                              : widget.exoplanet!.discoveryYear.toString(),
                          textAlign: TextAlign.center,
                          style: AppFonts.spaceGrotesk18,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      ExoplanetFeaturesWrap(
                        exoplanet: widget.exoplanet,
                        isShip: widget.isShip,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: WhiteBorderContainer(
                                border: 2,
                                withAnimation: false,
                                width: 50,
                                height: 50,
                                widget: IconButton(
                                  icon: Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                  onPressed: () async {
                                    _toggleFavorite();
                                  },
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              flex: 2,
                              child: PurpleButton(
                                  text:
                                      widget.isShip ? 'Book' : 'Book A Travel',
                                  onTap: () {
                                    widget.isShip
                                        ? ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                            const SnackBar(
                                              content: Text('Booked'),
                                            ),
                                          )
                                        : Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ExoplanetOrShipDetails(
                                                      isShip: true,
                                                      exoplanet:
                                                          widget.exoplanet,
                                                      model3D:
                                                          'assets/animations/voyager.glb',
                                                    )));
                                  })),
                          const SizedBox(
                            width: 10,
                          ),
                          widget.isShip
                              ? const SizedBox.shrink()
                              : Expanded(
                                  child: WhiteBorderContainer(
                                      border: 2,
                                      withAnimation: false,
                                      width: 50,
                                      height: 50,
                                      widget: IconButton(
                                        icon: const Icon(
                                          Icons.arrow_right,
                                          size: 25,
                                          color: AppColors.lightGray,
                                        ),
                                        onPressed: () {},
                                      )),
                                )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
