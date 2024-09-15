
import 'package:flutter/material.dart';

class Skelton extends StatelessWidget {
  const Skelton({
    super.key,
    this.height,
    this.width,
  });
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
