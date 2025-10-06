// =================================
// FILE: lib/widgets/glass.dart
// =================================
import 'dart:ui';
import 'package:flutter/material.dart';


class Glass extends StatelessWidget {
  final Widget child; final EdgeInsets padding; final double radius;
  const Glass({super.key, required this.child, this.padding = const EdgeInsets.all(12), this.radius = 16});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.6),
            border: Border.all(color: Theme.of(context).colorScheme.outline.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(radius),
          ),
          child: child,
        ),
      ),
    );
  }
}