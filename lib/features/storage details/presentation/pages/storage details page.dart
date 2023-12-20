import 'package:dribbox/core/resources/font%20weight%20manager.dart';
import 'package:dribbox/core/resources/style%20manager.dart';
import 'package:dribbox/features/storage%20details/presentation/widgets/chart%20section.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../domain/entites/section.dart';
import '../widgets/types section.dart';

class StorageDetailsPage extends StatelessWidget {
  const StorageDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Section> sections = [
      Section('Video', 300, Colors.blue),
      Section('Audio', 500, Colors.orange),
      Section('Mobile apps', 400, Colors.green),
      Section('Files', 1000, Colors.amber),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Storage details',
          style: StyleManager.bigTextStyle(
            fontSize: 20,
            fontWeight: FontWeightManager.semiBoldWeight,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChartSection(sections),
            const SizedBox(height: 27),
            Text(
              'Available',
              style: StyleManager.smallTextStyle(
                fontSize: 20,
                fontWeight: FontWeightManager.normalWeight,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '43.36 GB',
              style: StyleManager.bigTextStyle(fontSize: 24),
            ),
            const SizedBox(height: 12),
            Text(
              'Total 128 GB',
              style: StyleManager.smallTextStyle(
                fontSize: 20,
                fontWeight: FontWeightManager.normalWeight,
              ),
            ),
            const SizedBox(height: 44),
            TypesSection(sections),
          ],
        ),
      ),
    );
  }
}
