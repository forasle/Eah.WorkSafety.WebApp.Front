import 'package:aeah_work_safety/constants/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnGraph extends StatelessWidget {
  const ColumnGraph({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    var data = [
      _ChartData('Nöropatiler', 12),
      _ChartData('Migren', 15),
      _ChartData('Kronik Bel Ağrısı', 30),
      _ChartData('Kanser', 6.4),
      _ChartData('Astım', 14),
      _ChartData('Diabetes Mellitus', 144)
    ];
    return Padding(
      padding: Constant.padding8,
      child: Column(
        children: [
          Text(title, style: Theme.of(context).textTheme.headline5),
          const SizedBox(width: 500, child: Constant.dividerWithIndent),
          SizedBox(
            width: 500,
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(minimum: 0, maximum: 150, interval: 30),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_ChartData, String>>[
                  ColumnSeries<_ChartData, String>(
                    dataSource: data,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    name: 'Kaza/Ramak Kala',
                  )
                  //color: Color.fromRGBO(8, 142, 255, 1))
                ]),
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
