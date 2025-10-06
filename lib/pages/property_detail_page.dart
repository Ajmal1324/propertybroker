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

// =================================
// FILE: lib/pages/property_detail_page.dart
// =================================
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../models/property.dart';
import '../widgets/chips.dart';
import '../widgets/rating_stars.dart';
import 'broker_profile_page.dart';

class PropertyDetailPage extends StatelessWidget {
  final Property property;
  final bool testMode;
  const PropertyDetailPage({
    super.key,
    required this.property,
    this.testMode = true,
  });

  @override
  Widget build(BuildContext context) {
    final p = property;
    final priceStr = _inr(p.price);
    final deepLink = 'https://propertybroker-test.web.app/p/${p.id}';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Property Detail'),
        actions: [
          IconButton(
            tooltip: 'Share',
            icon: const Icon(Icons.share),
            onPressed: () => Share.share('Check this property: $deepLink'),
          ),
        ],
      ),

      // Sticky bottom bar for quick actions
      bottomNavigationBar: _BottomBar(
        priceStr: priceStr,
        onCall: () => _snack(context, 'Test Mode: Contact simulated'),
        onMeet: () => _snack(context, 'Test Mode: Meeting request simulated'),
        onShare: () => Share.share('Check this property: $deepLink'),
      ),

      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: LayoutBuilder(
            builder: (context, c) {
              final isWide = c.maxWidth > 950;

              // Use SingleChildScrollView to avoid overflows
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: isWide
                      ? Row(
                    key: const ValueKey('wide'),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left: gallery + extras
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            _Gallery(
                              (p.gallery.isNotEmpty ? p.gallery : [p.imageUrl]),
                              heroTag: 'prop:${p.id}',
                            ),
                            const SizedBox(height: 16),
                            _QuickStatsRow(p: p),
                            const SizedBox(height: 16),
                            _MapPreview(city: p.city, address: p.address),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Right: details card
                      Expanded(
                        flex: 5,
                        child: _DetailsCard(p: p, priceStr: priceStr, testMode: testMode),
                      ),
                    ],
                  )
                      : Column(
                    key: const ValueKey('narrow'),
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _Gallery(
                        (p.gallery.isNotEmpty ? p.gallery : [p.imageUrl]),
                        heroTag: 'prop:${p.id}',
                      ),
                      const SizedBox(height: 16),
                      _DetailsCard(p: p, priceStr: priceStr, testMode: testMode),
                      const SizedBox(height: 16),
                      _QuickStatsRow(p: p),
                      const SizedBox(height: 16),
                      _MapPreview(city: p.city, address: p.address),
                      const SizedBox(height: 84), // space above sticky bar
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  static void _snack(BuildContext context, String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

  static String _inr(double amount) {
    if (amount >= 10000000) {
      return '₹${(amount / 10000000).toStringAsFixed(amount % 10000000 == 0 ? 0 : 1)} Cr';
    }
    if (amount >= 100000) {
      return '₹${(amount / 100000).toStringAsFixed(amount % 100000 == 0 ? 0 : 1)} L';
    }
    return '₹${amount.toStringAsFixed(0)}';
  }
}

class _DetailsCard extends StatefulWidget {
  const _DetailsCard({
    required this.p,
    required this.priceStr,
    required this.testMode,
  });

  final Property p;
  final String priceStr;
  final bool testMode;

  @override
  State<_DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<_DetailsCard> {
  bool _more = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.p;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title + broker mini
            Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(p.broker.photoUrl)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(p.title,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w800),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      Text('${p.address}, ${p.city}',
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Info tiles
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _InfoTile(icon: Icons.currency_rupee, label: 'Price', value: widget.priceStr),
                _InfoTile(icon: Icons.aspect_ratio, label: 'Area', value: '${p.areaSqft.toStringAsFixed(0)} sqft'),
                _InfoTile(icon: Icons.king_bed, label: 'Bedrooms', value: '${p.beds}'),
                _InfoTile(icon: Icons.bathtub, label: 'Bathrooms', value: '${p.baths}'),
                _InfoTile(icon: Icons.confirmation_number, label: 'Property ID', value: p.id),
              ],
            ),
            const SizedBox(height: 12),

            // Broker row + rating
            Row(
              children: [
                const Icon(Icons.verified, size: 18),
                const SizedBox(width: 3),
                const Text('Broker'),
                const SizedBox(width: 3),
                RatingStars(rating: p.broker.rating),
                const Spacer(),
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BrokerProfilePage(
                          broker: p.broker,
                          testMode: widget.testMode,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.open_in_new),
                  label: const Text('Broker Profile'),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Amenities (scroll-safe)
            _AmenitiesSection(),
            const SizedBox(height: 10),

            // Collapsible description / extra details
            AnimatedCrossFade(
              crossFadeState: _more ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200),
              firstChild: const SizedBox.shrink(),
              secondChild: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.bodyMedium!,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'About this property',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Well-located home with modern interiors, abundant natural light, '
                            'and proximity to daily conveniences. This listing includes modular kitchen, '
                            'ample storage, and community amenities. Ideal for families and working professionals.',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () => setState(() => _more = !_more),
                icon: Icon(_more ? Icons.expand_less : Icons.expand_more),
                label: Text(_more ? 'Show less' : 'More details'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickStatsRow extends StatelessWidget {
  const _QuickStatsRow({required this.p});
  final Property p;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            _Stat(icon: Icons.location_city, label: 'City', value: p.city),
            const _Dot(),
            _Stat(icon: Icons.king_bed_outlined, label: 'Beds', value: '${p.beds}'),
            const _Dot(),
            _Stat(icon: Icons.bathtub_outlined, label: 'Baths', value: '${p.baths}'),
            const _Dot(),
            _Stat(icon: Icons.square_foot, label: 'Area', value: '${p.areaSqft.toStringAsFixed(0)} sqft'),
            const Spacer(),
            Text('ID: ${p.id}', style: text.bodySmall?.copyWith(color: text.bodySmall?.color?.withOpacity(0.7))),
          ],
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5,
      height: 5,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.outlineVariant,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.icon, required this.label, required this.value});
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: c.primary),
        const SizedBox(width: 6),
        Text('$label: ', style: Theme.of(context).textTheme.labelSmall),
        Text(value, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _MapPreview extends StatelessWidget {
  const _MapPreview({required this.city, required this.address});
  final String city;
  final String address;

  @override
  Widget build(BuildContext context) {
    // Placeholder card (no external API). You can wire Google Static Maps later.
    return Card(
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 220,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.08),
                    Theme.of(context).colorScheme.secondary.withOpacity(0.08),
                  ],
                ),
              ),
            ),
            Center(
              child: Icon(Icons.map, size: 78, color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.place, size: 18),
                    const SizedBox(width: 6),
                    Text('$address, $city'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Gallery extends StatefulWidget {
  final List<String> images;
  final String heroTag;
  const _Gallery(this.images, {required this.heroTag});
  @override
  State<_Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<_Gallery> {
  int index = 0;
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _openFullscreen(int start) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.85),
      builder: (_) => _FullscreenGallery(images: widget.images, startIndex: start, heroTag: widget.heroTag),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Hero(
        tag: widget.heroTag,
        child: AspectRatio(
          aspectRatio: 16 / 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Stack(
              children: [
                PageView.builder(
                  controller: controller,
                  onPageChanged: (i) => setState(() => index = i),
                  itemCount: widget.images.length,
                  itemBuilder: (_, i) => GestureDetector(
                    onTap: () => _openFullscreen(i),
                    child: Image.network(widget.images[i], fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.45),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      '${index + 1}/${widget.images.length}',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      const SizedBox(height: 8),
      // dots
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < widget.images.length; i++)
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: i == index ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: i == index
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(99),
              ),
            ),
        ],
      ),
    ]);
  }
}

// simple fullscreen gallery viewer
class _FullscreenGallery extends StatefulWidget {
  const _FullscreenGallery({
    required this.images,
    required this.startIndex,
    required this.heroTag,
  });

  final List<String> images;
  final int startIndex;
  final String heroTag;

  @override
  State<_FullscreenGallery> createState() => _FullscreenGalleryState();
}

class _FullscreenGalleryState extends State<_FullscreenGallery> {
  late final PageController _page = PageController(initialPage: widget.startIndex);
  int _i = 0;

  @override
  void initState() {
    super.initState();
    _i = widget.startIndex;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (_) => Navigator.pop(context),
      child: Stack(
        children: [
          PageView.builder(
            controller: _page,
            onPageChanged: (i) => setState(() => _i = i),
            itemCount: widget.images.length,
            itemBuilder: (_, i) => InteractiveViewer(
              clipBehavior: Clip.none,
              minScale: 1,
              maxScale: 3.5,
              child: Center(
                child: Hero(
                  tag: widget.heroTag,
                  child: Image.network(widget.images[i], fit: BoxFit.contain),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 12,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.45),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${_i + 1}/${widget.images.length}',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AmenitiesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const amenities = [
      InfoChip(icon: Icons.wifi, label: 'Wi-Fi'),
      InfoChip(icon: Icons.local_parking, label: 'Parking'),
      InfoChip(icon: Icons.elevator, label: 'Elevator'),
      InfoChip(icon: Icons.ac_unit, label: 'Air Conditioning'),
      InfoChip(icon: Icons.local_laundry_service, label: 'Washer'),
      InfoChip(icon: Icons.security, label: '24/7 Security'),
      InfoChip(icon: Icons.yard, label: 'Garden'),
      InfoChip(icon: Icons.pool, label: 'Pool'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Amenities', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
        const SizedBox(height: 8),
        Wrap(spacing: 8, runSpacing: 8, children: amenities),
      ],
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({
    required this.priceStr,
    required this.onCall,
    required this.onMeet,
    required this.onShare,
  });

  final String priceStr;
  final VoidCallback onCall;
  final VoidCallback onMeet;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            offset: const Offset(0, -2),
            blurRadius: 7,
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              decoration: BoxDecoration(
                color: c.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.currency_rupee, size: 15),
                  const SizedBox(width: 4),
                  Text(priceStr, style: const TextStyle(fontWeight: FontWeight.w800)),
                ],
              ),
            ),
            const Spacer(),
            OutlinedButton.icon(
              onPressed: onShare,
              icon: const Icon(Icons.share),
              label: const Text('Share'),
              // label: const Text(' '),
            ),
            const SizedBox(width: 5),
            OutlinedButton.icon(
              onPressed: onMeet,
              icon: const Icon(Icons.event_available),
              label: const Text('Meeting'),
            ),
            const SizedBox(width: 5),
            ElevatedButton.icon(
              onPressed: onCall,
              icon: const Icon(Icons.phone),
              label: const Text('Contact'),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _InfoTile({required this.icon, required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: Theme.of(context).textTheme.labelSmall),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
