import 'package:flutter/material.dart';

import '../../../../core/resources/font weight manager.dart';
import '../../../../core/resources/style manager.dart';
import '../../domain/entites/section.dart';

class TypeItem extends StatelessWidget {
  const TypeItem(this.section, {super.key});

  final Section section;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        Icon(
          Icons.circle,
          size: 15,
          color: section.color,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            section.title,
            style: StyleManager.bigTextStyle(
              fontSize: 18,
              fontWeight: FontWeightManager.mediumWeight,
            ),
          ),
        ),
        RotatedBox(
          quarterTurns: 2,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: LinearProgressIndicator(
              value: section.value / 1073741824,
              color: section.color,
              backgroundColor: section.color.withOpacity(0.2),
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
