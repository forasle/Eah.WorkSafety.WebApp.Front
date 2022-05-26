import 'package:aeah_work_safety/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnGraph extends StatelessWidget {
  ColumnGraph({Key? key, required this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    var data = [
      _ChartData('Ocak', 12),
      _ChartData('Şubat', 15),
      _ChartData('Mart', 30),
      _ChartData('Nisan', 6.4),
      _ChartData('Mayıs', 14),
      _ChartData('Toplam', 144)
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(title, style: Theme.of(context).textTheme.headline5),
          SizedBox(width: 500, child: dividerWithIndents()),
          SizedBox(
            width: 500,
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                primaryYAxis:
                    NumericAxis(minimum: 0, maximum: 150, interval: 30),
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