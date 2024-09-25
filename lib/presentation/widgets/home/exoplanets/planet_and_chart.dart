import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/widgets/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PlanetAndChart extends StatelessWidget {
  const PlanetAndChart({
    super.key,
    required this.model3D,
    required this.size,
    required this.defaultPlanets,
    required this.chartData,
    required this.isShip,
  });

  final String? model3D;
  final Size size;
  final List<String> defaultPlanets;
  final List<ChartData> chartData;
  final bool isShip;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Positioned(
          top: -size.height / 4,
          left: -size.width / 5,
          child: model3D != null
              ? Exoplanet3DContainer(
                  withTranslation: true,
                  model: model3D!,
                )
              : FittedBox(
                  child: Image.asset(
                    (defaultPlanets..shuffle()).first,
                    width: size.width / 1.4,
                    height: size.height / 1.4,
                    fit: BoxFit.contain,
                    color: AppColors.lightGray,
                  ),
                ),
        ),
        Positioned(
          right: 20,
          top: 40,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    '90°',
                    style: AppFonts.spaceGrotesk16,
                  ),
                  SizedBox(
                    width: size.width / 2.8,
                    height: size.width / 2.8,
                    child: SfCircularChart(
                      margin: EdgeInsets.zero,
                      series: <CircularSeries>[
                        DoughnutSeries<ChartData, String>(
                          dataSource: chartData,
                          startAngle: 360,
                          endAngle: -360,
                          innerRadius: '60%',
                          radius: '100%',
                          pointColorMapper: (ChartData data, _) => data.color,
                          xValueMapper: (ChartData data, _) =>
                              data.y.toString(),
                          yValueMapper: (ChartData data, _) => data.y,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                isShip
                    ? 'Max. Velocity'
                    : 'Average Temperature.\n 3x More than Earth',
              overflow: TextOverflow.fade,
              maxLines: 2,
                style: AppFonts.spaceGrotesk12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.y, this.color);

  final double y;
  final Color color;
}
