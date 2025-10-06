// =================================
// FILE: lib/widgets/rating_stars.dart
// =================================
import 'package:flutter/material.dart';


class RatingStars extends StatelessWidget {
  final double rating; // 0..5
  const RatingStars({super.key, required this.rating});
  @override
  Widget build(BuildContext context) {
    final full = rating.floor();
    final half = (rating - full) >= 0.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < full; i++) const Icon(Icons.star, size: 16, color: Colors.amber),
        if (half) const Icon(Icons.star_half, size: 16, color: Colors.amber),
        for (int i = 0; i < (5 - full - (half ? 1 : 0)); i++) const Icon(Icons.star_border, size: 16, color: Colors.amber),
      ],
    );
  }
}