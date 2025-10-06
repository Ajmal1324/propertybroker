// // =================================
// // =================================
// import 'package:flutter/material.dart';
// import '../models/property.dart';
// import '../pages/property_detail_page.dart';
// import 'chips.dart';
//
//
// class PropertyCard extends StatefulWidget {
//   final Property property; final VoidCallback onBrokerTap;
//   const PropertyCard({super.key, required this.property, required this.onBrokerTap});
//   @override
//   State<PropertyCard> createState() => _PropertyCardState();
// }
//
//
// class _PropertyCardState extends State<PropertyCard> {
//   bool hovering = false;
//   @override
//   Widget build(BuildContext context) {
//     final p = widget.property;
//     final currency = NumberFormatHelper.inr(p.price);
//
//
//     return MouseRegion(
//       onEnter: (_) => setState(() => hovering = true),
//       onExit: (_) => setState(() => hovering = false),
//       child: AnimatedScale(
//         duration: const Duration(milliseconds: 150),
//         scale: hovering ? 1.02 : 1.0,
//         child: Card(
//           clipBehavior: Clip.antiAlias,
//           elevation: hovering ? 2 : 0,
//           child: InkWell(
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (_) => PropertyDetailPage(property: p)),
//             ),
//             child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Hero(
//                 tag: 'prop:${p.id}',
//                 child: AspectRatio(
//                   aspectRatio: 16/9,
//                   child: Image.network(p.imageUrl, fit: BoxFit.cover),
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                     Text(p.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700), maxLines: 1, overflow: TextOverflow.ellipsis),
//                     const SizedBox(height: 4),
//                     Text('${p.address}, ${p.city}', style: Theme.of(context).textTheme.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
//                     const SizedBox(height: 8),
//                     Wrap(spacing: 12, runSpacing: 8, children: [
//                       InfoChip(icon: Icons.king_bed, label: '${p.beds} Beds'),
//                       InfoChip(icon: Icons.bathtub, label: '${p.baths} Baths'),
//                       InfoChip(icon: Icons.aspect_ratio, label: '${p.areaSqft.toStringAsFixed(0)} sqft'),
//                     ]),
//                     const Spacer(),
//                     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                       Text(currency, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
//                       TextButton.icon(onPressed: widget.onBrokerTap, icon: const Icon(Icons.person), label: Flexible(child: Text(p.broker.name, overflow: TextOverflow.ellipsis))),
//                     ]),
//                   ]),
//                 ),
//               ),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
// class NumberFormatHelper {
//   static String inr(double amount) {
//     if (amount >= 10000000) {
//       return '₹${(amount / 10000000).toStringAsFixed(amount % 10000000 == 0 ? 0 : 1)} Cr';
//     } else if (amount >= 100000) {
//       return '₹${(amount / 100000).toStringAsFixed(amount % 100000 == 0 ? 0 : 1)} L';
//     }
//     return '₹${amount.toStringAsFixed(0)}';
//   }
// }
import 'package:flutter/material.dart';
import '../models/property.dart';
import '../pages/property_detail_page.dart';

class PropertyCard extends StatelessWidget {
  final Property property;
  final VoidCallback? onBrokerTap;
  const PropertyCard({super.key, required this.property, this.onBrokerTap});

  @override
  Widget build(BuildContext context) {
    final p = property;
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => PropertyDetailPage(property: p)),
      ),
      borderRadius: BorderRadius.circular(16),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 10,
              child: Hero(
                tag: 'prop:${p.id}',
                child: Image.network(p.imageUrl, fit: BoxFit.cover),
              ),
            ),
            ListTile(
              title: Text(p.title, maxLines: 1, overflow: TextOverflow.ellipsis),
              subtitle: Text('${p.address}, ${p.city}',
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              trailing: IconButton(
                tooltip: 'Broker',
                icon: const Icon(Icons.verified),
                onPressed: onBrokerTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
