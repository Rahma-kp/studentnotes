import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatelessWidget {
  const PieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('chart',style: TextStyle(color: Colors.white),),
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
        ),
        body: SfCircularChart(
            legend: const Legend(isVisible: true),
            series: <PieSeries<_PieData, String>>[
              PieSeries<_PieData, String>(
                  explode: true,
                  explodeIndex: 0,
                  dataSource: pieData,
                  xValueMapper: (_PieData data, _) => data.xData,
                  yValueMapper: (_PieData data, _) => data.yData,
                  dataLabelMapper: (_PieData data, _) => data.text,
                  dataLabelSettings: const DataLabelSettings(isVisible: true)),
            ]),
      ),
    );
  }
}

class _PieData {
  _PieData(this.xData, this.yData, this.text);
  final String xData;
  final num yData;
  final String text;
}

final List<_PieData> pieData = [
  _PieData('ENGLISH', 30, '30%'),
  _PieData('PHYSICS', 30, '30%'),
  _PieData('MATHEMATICS', 20, '20%'),
  _PieData('CHEMISTRY', 15, '15%'),
  _PieData('SOCIAL SCIENCE', 10, '10%'),
  _PieData('BIOLOGY', 25, '25%'),
  _PieData('ZOOLOGY', 45, '45%'),
  _PieData('BOTANY', 20, '20%')
];
