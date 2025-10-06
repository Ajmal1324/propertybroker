// // FILE: lib/pages/property_detail_page.dart
// import 'package:flutter/material.dart';
// import '../models/property.dart';
// import '../widgets/chips.dart';
// import '../widgets/rating_stars.dart';
// import 'broker_profile_page.dart';
//
// class PropertyDetailPage extends StatelessWidget {
//   final Property property;
//   final bool testMode;
//
//   const PropertyDetailPage({
//     super.key,
//     required this.property,
//     this.testMode = true,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final p = property;
//     final priceStr = _inrString(p.price);
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('Property Detail')),
//       body: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 1100),
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: LayoutBuilder(
//               builder: (context, c) {
//                 final isWide = c.maxWidth > 900;
//                 return Flex(
//                   direction: isWide ? Axis.horizontal : Axis.vertical,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Gallery
//                     Expanded(
//                       flex: 5,
//                       child: _Gallery(
//                         p.gallery.isNotEmpty ? p.gallery : [p.imageUrl],
//                         heroTag: 'prop:${p.id}',
//                       ),
//                     ),
//                     const SizedBox(width: 16, height: 16),
//                     // Info card
//                     Expanded(
//                       flex: 5,
//                       child: Card(
//                         child: Padding(
//                           padding: const EdgeInsets.all(20),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   CircleAvatar(
//                                     backgroundImage:
//                                     NetworkImage(p.broker.photoUrl),
//                                   ),
//                                   const SizedBox(width: 12),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           p.title,
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .titleLarge
//                                               ?.copyWith(
//                                               fontWeight: FontWeight.w800),
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//                                         Text(
//                                           '${p.address}, ${p.city}',
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .bodySmall,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 16),
//                               Wrap(
//                                 spacing: 12,
//                                 runSpacing: 12,
//                                 children: [
//                                   _InfoTile(
//                                     icon: Icons.currency_rupee,
//                                     label: 'Price',
//                                     value: priceStr,
//                                   ),
//                                   _InfoTile(
//                                     icon: Icons.aspect_ratio,
//                                     label: 'Area',
//                                     value:
//                                     '${p.areaSqft.toStringAsFixed(0)} sqft',
//                                   ),
//                                   _InfoTile(
//                                     icon: Icons.king_bed,
//                                     label: 'Bedrooms',
//                                     value: '${p.beds}',
//                                   ),
//                                   _InfoTile(
//                                     icon: Icons.bathtub,
//                                     label: 'Bathrooms',
//                                     value: '${p.baths}',
//                                   ),
//                                   _InfoTile(
//                                     icon: Icons.confirmation_number,
//                                     label: 'Property ID',
//                                     value: p.id,
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 12),
//                               Row(
//                                 children: [
//                                   const Icon(Icons.verified, size: 18),
//                                   const SizedBox(width: 6),
//                                   const Text('Broker'),
//                                   const SizedBox(width: 8),
//                                   RatingStars(rating: p.broker.rating),
//                                   const Spacer(),
//                                   TextButton.icon(
//                                     onPressed: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (_) => BrokerProfilePage(
//                                             broker: p.broker,
//                                             testMode: testMode,
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                     icon: const Icon(Icons.open_in_new),
//                                     label: const Text('Broker Profile'),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 12),
//                               Wrap(
//                                 spacing: 8,
//                                 runSpacing: 8,
//                                 children: const [
//                                   InfoChip(icon: Icons.wifi, label: 'Wi-Fi'),
//                                   InfoChip(
//                                       icon: Icons.local_parking,
//                                       label: 'Parking'),
//                                   InfoChip(
//                                       icon: Icons.elevator, label: 'Elevator'),
//                                   InfoChip(
//                                       icon: Icons.ac_unit,
//                                       label: 'Air Conditioning'),
//                                 ],
//                               ),
//                               const SizedBox(height: 16),
//                               Row(
//                                 children: [
//                                   ElevatedButton.icon(
//                                     onPressed: () => _snack(
//                                         context, 'Test Mode: Contact simulated'),
//                                     icon: const Icon(Icons.phone),
//                                     label: const Text('Contact Broker'),
//                                   ),
//                                   const SizedBox(width: 12),
//                                   OutlinedButton.icon(
//                                     onPressed: () => _snack(context,
//                                         'Test Mode: Meeting request simulated'),
//                                     icon: const Icon(Icons.event_available),
//                                     label: const Text('Request Meeting'),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _snack(BuildContext context, String msg) =>
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
//
//   // Simple INR formatter (kept local to avoid cross-file deps)
//   String _inrString(double amount) {
//     if (amount >= 10000000) {
//       return '₹${(amount / 10000000).toStringAsFixed(amount % 10000000 == 0 ? 0 : 1)} Cr';
//     } else if (amount >= 100000) {
//       return '₹${(amount / 100000).toStringAsFixed(amount % 100000 == 0 ? 0 : 1)} L';
//     }
//     return '₹${amount.toStringAsFixed(0)}';
//   }
// }
//
// class _Gallery extends StatefulWidget {
//   final List<String> images;
//   final String heroTag;
//   const _Gallery(this.images, {required this.heroTag});
//
//   @override
//   State<_Gallery> createState() => _GalleryState();
// }
//
// class _GalleryState extends State<_Gallery> {
//   int index = 0;
//   final controller = PageController();
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Hero(
//           tag: widget.heroTag,
//           child: AspectRatio(
//             aspectRatio: 16 / 10,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(24),
//               child: PageView.builder(
//                 controller: controller,
//                 onPageChanged: (i) => setState(() => index = i),
//                 itemCount: widget.images.length,
//                 itemBuilder: (_, i) =>
//                     Image.network(widget.images[i], fit: BoxFit.cover),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 8),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             for (int i = 0; i < widget.images.length; i++)
//               AnimatedContainer(
//                 duration: const Duration(milliseconds: 200),
//                 margin: const EdgeInsets.symmetric(horizontal: 4),
//                 width: i == index ? 20 : 8,
//                 height: 8,
//                 decoration: BoxDecoration(
//                   color: i == index
//                       ? Theme.of(context).colorScheme.primary
//                       : Theme.of(context).colorScheme.outlineVariant,
//                   borderRadius: BorderRadius.circular(99),
//                 ),
//               ),
//           ],
//         ),
//       ],
//     );
//   }
// }
//
// class _InfoTile extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final String value;
//
//   const _InfoTile({
//     required this.icon,
//     required this.label,
//     required this.value,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 220,
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         border:
//         Border.all(color: Theme.of(context).colorScheme.outlineVariant),
//       ),
//       child: Row(
//         children: [
//           Icon(icon),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(label, style: Theme.of(context).textTheme.labelSmall),
//                 Text(
//                   value,
//                   style: Theme.of(context)
//                       .textTheme
//                       .bodyLarge
//                       ?.copyWith(fontWeight: FontWeight.w700),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../models/property.dart';
import '../widgets/chips.dart';
import '../widgets/rating_stars.dart';
import 'broker_profile_page.dart';

class PropertyDetailPage extends StatelessWidget {
  final Property property;
  final bool testMode;
  const PropertyDetailPage({super.key, required this.property, this.testMode = true});

  @override
  Widget build(BuildContext context) {
    final p = property;
    final priceStr = _inr(p.price);

    return Scaffold(
      appBar: AppBar(title: const Text('Property Detail')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: LayoutBuilder(builder: (context, c) {
              final isWide = c.maxWidth > 900;
              return Flex(
                direction: isWide ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 5, child: _Gallery(p.gallery.isNotEmpty ? p.gallery : [p.imageUrl], heroTag: 'prop:${p.id}')),
                  const SizedBox(width: 16, height: 16),
                  Expanded(
                    flex: 5,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Row(children: [
                            CircleAvatar(backgroundImage: NetworkImage(p.broker.photoUrl)),
                            const SizedBox(width: 12),
                            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text(p.title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800), maxLines: 1, overflow: TextOverflow.ellipsis),
                              Text('${p.address}, ${p.city}', style: Theme.of(context).textTheme.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                            ])),
                          ]),
                          const SizedBox(height: 16),
                          Wrap(spacing: 12, runSpacing: 12, children: [
                            _InfoTile(icon: Icons.currency_rupee, label: 'Price', value: priceStr),
                            _InfoTile(icon: Icons.aspect_ratio, label: 'Area', value: '${p.areaSqft.toStringAsFixed(0)} sqft'),
                            _InfoTile(icon: Icons.king_bed, label: 'Bedrooms', value: '${p.beds}'),
                            _InfoTile(icon: Icons.bathtub, label: 'Bathrooms', value: '${p.baths}'),
                            _InfoTile(icon: Icons.confirmation_number, label: 'Property ID', value: p.id),
                          ]),
                          const SizedBox(height: 12),
                          Row(children: [
                            const Icon(Icons.verified, size: 18), const SizedBox(width: 6), const Text('Broker'), const SizedBox(width: 8),
                            RatingStars(rating: p.broker.rating),
                            const Spacer(),
                            TextButton.icon(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (_) => BrokerProfilePage(broker: p.broker, testMode: testMode),
                                ));
                              },
                              icon: const Icon(Icons.open_in_new), label: const Text('Broker Profile'),
                            ),
                          ]),
                          const SizedBox(height: 12),
                          Wrap(spacing: 8, runSpacing: 8, children: const [
                            InfoChip(icon: Icons.wifi, label: 'Wi-Fi'),
                            InfoChip(icon: Icons.local_parking, label: 'Parking'),
                            InfoChip(icon: Icons.elevator, label: 'Elevator'),
                            InfoChip(icon: Icons.ac_unit, label: 'Air Conditioning'),
                          ]),
                          const SizedBox(height: 16),
                          Row(children: [
                            ElevatedButton.icon(
                              onPressed: () => _snack(context, 'Test Mode: Contact simulated'),
                              icon: const Icon(Icons.phone), label: const Text('Contact Broker'),
                            ),
                            const SizedBox(width: 12),
                            OutlinedButton.icon(
                              onPressed: () => _snack(context, 'Test Mode: Meeting request simulated'),
                              icon: const Icon(Icons.event_available), label: const Text('Request Meeting'),
                            ),
                            const SizedBox(width: 12),
                            OutlinedButton.icon(
                              onPressed: () {
                                final url = 'https://propertybroker-test.web.app/p/${p.id}';
                                Share.share('Check this property: $url');
                              },
                              icon: const Icon(Icons.share), label: const Text('Share'),
                            ),
                          ]),
                        ]),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  static void _snack(BuildContext context, String msg) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  static String _inr(double amount) {
    if (amount >= 10000000) return '₹${(amount / 10000000).toStringAsFixed(amount % 10000000 == 0 ? 0 : 1)} Cr';
    if (amount >= 100000) return '₹${(amount / 100000).toStringAsFixed(amount % 100000 == 0 ? 0 : 1)} L';
    return '₹${amount.toStringAsFixed(0)}';
  }
}

class _Gallery extends StatefulWidget {
  final List<String> images; final String heroTag;
  const _Gallery(this.images, {required this.heroTag});
  @override
  State<_Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<_Gallery> {
  int index = 0;
  final controller = PageController();
  @override void dispose() { controller.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Hero(
        tag: widget.heroTag,
        child: AspectRatio(
          aspectRatio: 16/10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: PageView.builder(
              controller: controller,
              onPageChanged: (i) => setState(() => index = i),
              itemCount: widget.images.length,
              itemBuilder: (_, i) => Image.network(widget.images[i], fit: BoxFit.cover),
            ),
          ),
        ),
      ),
      const SizedBox(height: 8),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        for (int i = 0; i < widget.images.length; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: i == index ? 20 : 8, height: 8,
            decoration: BoxDecoration(
              color: i == index ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.outlineVariant,
              borderRadius: BorderRadius.circular(99),
            ),
          ),
      ]),
    ]);
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon; final String label; final String value;
  const _InfoTile({required this.icon, required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220, padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Row(children: [
        Icon(icon), const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label, style: Theme.of(context).textTheme.labelSmall),
          Text(value, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700), overflow: TextOverflow.ellipsis),
        ])),
      ]),
    );
  }
}
