import 'package:aeah_work_safety/constants/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircularGraph extends StatelessWidget {
  const CircularGraph({Key? key, required this.chartData, required this.title}) : super(key: key);
  final List<ChartData> chartData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constant.padding8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headline5),
          const SizedBox(width: 500, child: Constant.dividerWithIndent),
          SizedBox(
            width: 500,
            child: SfCircularChart(series: <CircularSeries>[
              // Render pie chart
              PieSeries<ChartData, String>(
                  dataLabelMapper: (ChartData data, _) => data.x,
                  dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      //overflowMode: OverflowMode.trim,
                      labelIntersectAction: LabelIntersectAction.shift,
                      labelPosition: ChartDataLabelPosition.outside,
                      useSeriesColor: true,
                      connectorLineSettings: ConnectorLineSettings(type: ConnectorType.curve, length: '25%')),
                  dataSource: chartData,
                  pointColorMapper: (ChartData data, _) => data.color,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y)
            ]),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);

  final String x;
  final double y;
  final Color? color;
}
