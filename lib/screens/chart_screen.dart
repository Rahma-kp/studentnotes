import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class chart_screen extends StatelessWidget {
  const chart_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: PieChart( swapAnimationDuration: Duration(milliseconds: 0),swapAnimationCurve: Curves.bounceIn,
                  PieChartData(
                    sections:[
                    PieChartSectionData(value: 200,title: "Math",color: Color.fromARGB(255, 86, 108, 152)),
                    PieChartSectionData(value: 250,title: "zoology",color: Color.fromARGB(255, 147, 201, 228)),
                    PieChartSectionData(value: 250,title: "English",color: Color.fromARGB(255, 55, 145, 139)),
                    PieChartSectionData(value: 120,title: "physics",color: Color.fromARGB(255, 216, 119, 181)),
                    ]),
                  ),
    );
         
  }
}