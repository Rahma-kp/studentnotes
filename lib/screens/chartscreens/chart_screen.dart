// pie_chart.dart
import 'package:flutter/material.dart';
import 'package:studentnot/functions/note_function.dart';
import 'package:studentnot/model/note_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatelessWidget {
  const PieChart({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, int> calculateCategoryCounts(List<NotesData> notes) {
      Map<String, int> categoryCounts = {};
      for (var note in notes) {
        String category = note.category ?? "Other";
        categoryCounts[category] = (categoryCounts[category] ?? 0) + 1;
      }
      return categoryCounts;
    }

    List<NotesData> noteList = noteListNotifier.value;
    Map<String, int> categoryCounts = calculateCategoryCounts(noteList);

   List<_PieData> pieData = categoryCounts.entries
    .map((MapEntry<String, int> entry) =>
        _PieData(entry.key, entry.value.toDouble(), '${entry.value}%'))
    .toList();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false,
          title: const Text('𝐂𝐡𝐚𝐫𝐭', style:  TextStyle(color: Colors.white)),
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
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            ),
          ],
        ),
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
