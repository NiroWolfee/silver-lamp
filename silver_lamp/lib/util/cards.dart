import 'package:flutter/material.dart';

class SwipeCard extends StatelessWidget {
  final color;

  SwipeCard({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: color,
      );
  }
}