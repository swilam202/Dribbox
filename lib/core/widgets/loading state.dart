import 'package:flutter/material.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({super.key,required this.color});

  final Color color;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(color: color,backgroundColor: color.withOpacity(0.2),),
    );
  }
}
