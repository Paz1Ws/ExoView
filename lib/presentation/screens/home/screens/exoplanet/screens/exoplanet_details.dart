import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/data/data.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class ExoplanetDetails extends StatelessWidget {
  final String? model3D;
  //final Exoplanet exoplanet;
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
  ExoplanetDetails({
    super.key,
    //  required this.exoplanet,
    this.model3D,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              model3D != null
                  ? Exoplanet3DContainer(
                      withTranslation: true,
                      model: model3D!,
                    )
                  : Expanded(
                      flex: 2,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(-size.width / 5, 0.0, 0.0),
                        child: FittedBox(
                          child: Image.asset(
                            (defaultPlanets..shuffle()).first,
                            width: size.width / 3,
                            height: size.height / 3.5,
                            fit: BoxFit.fitWidth,
                            color: AppColors.lightGray,
                          ),
                        ),
                      ),
                    ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(right: size.width / 6),
                  child: FittedBox(
                    fit: BoxFit.none,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Text(
                              '90°',
                              style: AppFonts.spaceGrotesk16,
                            ),
                            SfCircularChart(series: <CircularSeries>[
                              // Renders doughnut chart
                              DoughnutSeries<ChartData, String>(
                                  dataSource: chartData,
                                  startAngle: 360,
                                  endAngle: -360,
                                  innerRadius: '60%',
                                  radius: '50%',
                                  pointColorMapper: (ChartData data, _) =>
                                      data.color,
                                  xValueMapper: (ChartData data, _) =>
                                      data.y.toString(),
                                  yValueMapper: (ChartData data, _) => data.y)
                            ]),
                          ],
                        ),
                        Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, -size.height / 15, 0.0),
                          child: Text(
                            'Average Temperature.\n 3x More than Earth',
                            style: AppFonts.spaceGrotesk16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Flash Tunder Exoplanet',
                style: AppFonts.spaceGrotesk18,
              ),
              const SizedBox(
                width: 10,
              ),
              WhiteBorderContainer(
                widget: Text(
                  '2025',
                  textAlign: TextAlign.center,
                  style: AppFonts.spaceGrotesk18,
                ),
              )
            ],
          ),
          ExoplanetFeaturesWrap(
              // exoplanet: exoplanet,
              ),
          Row(
            children: [
              Expanded(
                child: WhiteBorderContainer(
                    withAnimation: false,
                    widget: IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  flex: 2,
                  child: PurpleButton(text: 'Book A Travel', onTap: () {})),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: WhiteBorderContainer(
                    withAnimation: false,
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
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.y, this.color);

  final double y;
  final Color color;
}
