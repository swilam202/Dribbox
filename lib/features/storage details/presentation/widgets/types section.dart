import 'package:flutter/material.dart';

import '../../domain/entites/section.dart';
import 'type item.dart';

class TypesSection extends StatelessWidget {
  const TypesSection(this.sections, {super.key});

  final List<Section> sections;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 50,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: sections.length,
      itemBuilder: (context, index) {
        return TypeItem(sections[index]);
      },
    );
  }
}
