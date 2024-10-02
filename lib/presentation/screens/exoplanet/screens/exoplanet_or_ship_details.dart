import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class ExoplanetOrShipDetails extends StatelessWidget {
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
    this.model3D,
    this.isShip = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return PurpleBackground(
      withNavigation: false,
      withAppBar: isShip ? true : false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.4,
              width: size.width,
              child: PlanetAndChart(
                  model3D: model3D,
                  size: size,
                  defaultPlanets: defaultPlanets,
                  chartData: chartData,
                  isShip: isShip),
            ),
            Transform(
              transform: Matrix4.identity()
                ..translate(0.0, -size.height * 0.05, 0.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isShip ? 'Nebula Voyager' : 'Flash Thunder Exoplanet',
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
                          '2025',
                          textAlign: TextAlign.center,
                          style: AppFonts.spaceGrotesk18,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        ExoplanetFeaturesWrap(
                          isShip: isShip,
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
                                    icon: const Icon(
                                      Icons.favorite_border,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {},
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 2,
                                child: PurpleButton(
                                    text: isShip ? 'Book' : 'Book A Travel',
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ExoplanetOrShipDetails(
                                                    isShip: true,
                                                    model3D:
                                                        'assets/animations/voyager.glb',
                                                  )));
                                    })),
                            const SizedBox(
                              width: 10,
                            ),
                            isShip
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
            ),
          ],
        ),
      ),
    );
  }
}
