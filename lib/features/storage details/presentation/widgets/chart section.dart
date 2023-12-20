import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../domain/entites/section.dart';

class ChartSection extends StatelessWidget {
  const ChartSection(this.sections, {super.key});

  final List<Section> sections;

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      series: [
        DoughnutSeries<Section, String>(
          name: 'Storage',
          animationDelay: 1.0,
          strokeColor: Colors.green,
          dataSource: sections,
          xValueMapper: (datum, index) => datum.title,
          yValueMapper: (datum, index) => datum.value,
          pointColorMapper: (datum, index) => datum.color,
        ),
      ],
    );
  }
}
