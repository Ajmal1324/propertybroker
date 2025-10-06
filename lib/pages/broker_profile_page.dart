// // =================================
// // FILE: lib/pages/broker_profile_page.dart
// // =================================
// import 'package:flutter/material.dart';
// import '../models/broker.dart';
// // import '../data/mock_data.dart';
// import '../models/mock_data.dart';
// import '../widgets/property_card.dart';
// import '../widgets/rating_stars.dart';
//
//
// class BrokerProfilePage extends StatelessWidget {
//   final Broker broker; final bool testMode;
//   const BrokerProfilePage({super.key, required this.broker, this.testMode = true});
//
//
//   @override
//   Widget build(BuildContext context) {
//     final listed = mockProperties.where((p) => p.broker.id == broker.id).toList();
//     final listedProps = listed.isEmpty ? mockProperties.take(3).toList() : listed;
//
//
//     return Scaffold(
//         body: CustomScrollView(
//           slivers: [
//             SliverAppBar.large(
//               pinned: true,
//               flexibleSpace: FlexibleSpaceBar(
//                 title: Text(broker.name),
//                 background: Stack(fit: StackFit.expand, children: [
//                   Image.network(broker.photoUrl, fit: BoxFit.cover),
//                   DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(
//                     begin: Alignment.bottomCenter, end: Alignment.topCenter,
//                     colors: [Colors.black.withOpacity(0.5), Colors.transparent],
//                   ))),
//                 ]),
//               ),
//             ),
//             SliverToBoxAdapter(child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 Row(children: [
//                   const Icon(Icons.verified, size: 18), const SizedBox(width: 6), const Text('Top-rated'), const SizedBox(width: 8), RatingStars(rating: broker.rating),
//                   const Spacer(), Text('${broker.dealsClosed} deals closed'),
//                 ]),
//                 const SizedBox(height: 12),
//                 Wrap(spacing: 12, runSpacing: 8, children: [
//                   _ContactPill(icon: Icons.phone, label: broker.phone),
//                   _ContactPill(icon: Icons.email, label: broker.email),
//                 ]),
//                 const SizedBox(height: 20),
//                 Text('Listed Properties', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
//               ]),
//             )),
//             SliverPadding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               sliver: SliverGrid(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3, mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: 1.2,
//                 ),
//                 delegate: SliverChildBuilderDelegate(
//                       (context, i) => PropertyCard(property: listedProps[i], onBrokerTap: () {}),
//                   childCount: listedProps.length,
//                 ),
//               ),
//             ),
//           ],
//         ),
//     );
//   }
// }
// class _ContactPill extends StatelessWidget {
//   const _ContactPill({required this.icon, required this.label});
//   final IconData icon; final String label;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(999),
//         border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
//       ),
//       child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(icon, size: 16), const SizedBox(width: 6), Text(label)]),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../models/broker.dart';
// import '../data/mock_data.dart';
import '../models/mock_data.dart';
import '../widgets/property_card.dart';
import '../widgets/rating_stars.dart';

class BrokerProfilePage extends StatelessWidget {
  final Broker broker; final bool testMode;
  const BrokerProfilePage({super.key, required this.broker, this.testMode = true});

  @override
  Widget build(BuildContext context) {
    final listed = mockProperties.where((p) => p.broker.id == broker.id).toList();
    final listedProps = listed.isEmpty ? mockProperties.take(3).toList() : listed;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            pinned: true,
            actions: [
              IconButton(
                onPressed: () {
                  final url = 'https://propertybroker-test.web.app/b/${broker.id}';
                  Share.share('View my profile and listings: $url');
                },
                icon: const Icon(Icons.share),
                tooltip: 'Share profile',
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(broker.name),
              background: Stack(fit: StackFit.expand, children: [
                Image.network(broker.photoUrl, fit: BoxFit.cover),
                DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(
                  begin: Alignment.bottomCenter, end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                ))),
              ]),
            ),
          ),
          SliverToBoxAdapter(child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                const Icon(Icons.verified, size: 18), const SizedBox(width: 6),
                const Text('Top-rated'), const SizedBox(width: 8),
                RatingStars(rating: broker.rating),
                const Spacer(), Text('${broker.dealsClosed} deals closed'),
              ]),
              const SizedBox(height: 12),
              Wrap(spacing: 12, runSpacing: 8, children: [
                _ContactPill(icon: Icons.phone, label: broker.phone),
                _ContactPill(icon: Icons.email, label: broker.email),
              ]),
              const SizedBox(height: 20),
              Text('Listed Properties', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
            ]),
          )),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: 1.2,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, i) => PropertyCard(property: listedProps[i], onBrokerTap: () {}),
                childCount: listedProps.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactPill extends StatelessWidget {
  const _ContactPill({required this.icon, required this.label});
  final IconData icon; final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(icon, size: 16), const SizedBox(width: 6), Text(label)]),
    );
  }
}
