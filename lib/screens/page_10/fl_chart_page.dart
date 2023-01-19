import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lear_second_fetch_bloc/widgets/my_drawer.dart';

class FlChartPage extends StatefulWidget {
  const FlChartPage({super.key});

  static const id = 'fl-chart-page';

  @override
  State<FlChartPage> createState() => _FlChartPageState();
}

class _FlChartPageState extends State<FlChartPage> {
  List<Color> gradientColor = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
    const Color(0xff02d39a),
  ];

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color.fromARGB(255, 152, 154, 156),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('MAR', style: style);
        break;
      case 4:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 30, //change size on your need
          color: Colors.white, //change color on your need
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Container(
          width: double.infinity,
          height: 350,
          child: LineChart(
            LineChartData(
              borderData: FlBorderData(
                show: true,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              gridData: FlGridData(
                show: true,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.white,
                    strokeWidth: 1,
                  );
                },
                getDrawingVerticalLine: (value) {
                  return FlLine(
                    color: Colors.white,
                    strokeWidth: 1,
                  );
                },
              ),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 35,
                    getTitlesWidget: bottomTitleWidgets,
                  ),
                ),
              ),
              maxX: 15,
              maxY: 8,
              minX: 0,
              minY: 0,
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    const FlSpot(0, 2),
                    const FlSpot(5, 5),
                    const FlSpot(8, 4),
                    const FlSpot(9, 4),
                  ],
                  isCurved: true,
                  gradient: const LinearGradient(
                    colors: [
                      Colors.black12,
                      Colors.white70,
                      Colors.white,
                    ],
                  ),
                  barWidth: 5,
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors:
                          gradientColor.map((e) => e.withOpacity(0.3)).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
