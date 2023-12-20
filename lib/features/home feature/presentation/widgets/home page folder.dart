import 'package:dribbox/core/resources/font%20weight%20manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/style manager.dart';

class HomePageFolder extends StatelessWidget {
  const HomePageFolder({
    super.key,
    required this.color,
    required this.title,
    required this.icon,
  });

  final String title;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      splashColor: color.withOpacity(0.05),
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: color,
              size: 35,
            ),
            const SizedBox(height: 7),
            Text(
              title,
              style: StyleManager.smallTextStyle(
                fontSize: 15,
                color: color,
                fontWeight: FontWeightManager.semiBoldWeight,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              'December 20.2020',
              style: StyleManager.smallTextStyle(
                fontSize: 10,
                color: color.withOpacity(0.9),
                fontWeight: FontWeightManager.normalWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
