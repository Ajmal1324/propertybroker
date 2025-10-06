// =================================
// FILE: lib/widgets/chips.dart
// =================================
import 'package:flutter/material.dart';


class InfoChip extends StatelessWidget {
  final IconData icon; final String label;
  const InfoChip({super.key, required this.icon, required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, size: 16), const SizedBox(width: 6), Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
      ]),
    );
  }
}