import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphWidget extends StatelessWidget {
  final List<FlSpot> dataPoints;

  GraphWidget({this.dataPoints = const [FlSpot(0, 0)]});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(show: true),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: dataPoints,
            isCurved: true,
            colors: [Colors.deepPurpleAccent],
            belowBarData: BarAreaData(show: false),
          )
        ],
      ),
    );
  }
}
