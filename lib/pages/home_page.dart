// // =================================
// // FILE: lib/pages/home_page.dart
// // =================================
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher_string.dart';
//
// // import '../data/mock_data.dart';
// import '../models/mock_data.dart';
// import '../widgets/property_card.dart';
// import '../models/broker.dart';
// import '../state/session.dart';
// import 'broker_profile_page.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({
//     super.key,
//     required this.testMode,
//     required this.onToggleTestMode,
//     required this.themeMode,
//     required this.onToggleTheme,
//   });
//
//   final bool testMode;
//   final VoidCallback onToggleTestMode;
//   final ThemeMode themeMode;
//   final VoidCallback onToggleTheme;
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
//   String query = '';
//   late AnimationController _headerController;
//   late AnimationController _searchController;
//   late Animation<double> _headerFadeAnimation;
//   late Animation<Offset> _headerSlideAnimation;
//   late Animation<double> _searchScaleAnimation;
//   bool _searchFocused = false;
//
//   // NEW: in-memory session (no packages)
//   final Session session = Session();
//
//   @override
//   void initState() {
//     super.initState();
//     _headerController = AnimationController(
//       duration: const Duration(milliseconds: 800),
//       vsync: this,
//     );
//     _searchController = AnimationController(
//       duration: const Duration(milliseconds: 600),
//       vsync: this,
//     );
//
//     _headerFadeAnimation = CurvedAnimation(
//       parent: _headerController,
//       curve: Curves.easeOut,
//     );
//     _headerSlideAnimation = Tween<Offset>(
//       begin: const Offset(0, -0.5),
//       end: Offset.zero,
//     ).animate(
//       CurvedAnimation(parent: _headerController, curve: Curves.easeOutCubic),
//     );
//     _searchScaleAnimation = Tween<double>(begin: 0.95, end: 1).animate(
//       CurvedAnimation(parent: _searchController, curve: Curves.easeOutBack),
//     );
//
//     _headerController.forward();
//     Future.delayed(
//       const Duration(milliseconds: 200),
//       _searchController.forward,
//     );
//
//     session.addListener(() => setState(() {}));
//   }
//
//   @override
//   void dispose() {
//     _headerController.dispose();
//     _searchController.dispose();
//     session.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Base list: admin/guest = all, broker = only their listings
//     final base =
//         session.isBroker
//             ? mockProperties
//                 .where((p) => p.broker.id == session.currentBroker!.id)
//                 .toList()
//             : mockProperties;
//
//     // Apply text query
//     final filtered =
//         base.where((p) {
//           final q = query.toLowerCase();
//           return p.title.toLowerCase().contains(q) ||
//               p.city.toLowerCase().contains(q) ||
//               p.broker.name.toLowerCase().contains(q);
//         }).toList();
//
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: FadeTransition(
//           opacity: _headerFadeAnimation,
//           child: SlideTransition(
//             position: _headerSlideAnimation,
//             child: Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         Theme.of(context).colorScheme.primary,
//                         Theme.of(context).colorScheme.secondary,
//                       ],
//                     ),
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Theme.of(
//                           context,
//                         ).colorScheme.primary.withOpacity(0.3),
//                         blurRadius: 8,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: const Icon(Icons.home_work, size: 16),
//                 ),
//                 const SizedBox(width: 10),
//                 Column(
//                   children: [
//                     const Text(
//                       'Discover Properties',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 0.4,
//                         fontSize: 12,
//                       ),
//                     ),
//
//                     // _RolePill(
//                     //   session: session,
//                     //   onPickAdmin: () => session.setAdmin(),
//                     //   onPickBroker: () => _openBrokerLoginSheet(context),
//                     //   onLogout: () => session.logout(),
//                     // ),
//                   ],
//                 ),
//                 const SizedBox(width: 10),
//
//                 // NEW: Role pill
//                 // _RolePill(
//                 //   session: session,
//                 //   onPickAdmin: () => session.setAdmin(),
//                 //   onPickBroker: () => _openBrokerLoginSheet(context),
//                 //   onLogout: () => session.logout(),
//                 // ),
//               ],
//             ),
//           ),
//         ),
//         actions: [
//           _buildAnimatedActionButton(
//             tooltip: widget.testMode ? 'Test Mode ON' : 'Test Mode OFF',
//             onPressed: widget.onToggleTestMode,
//             icon: widget.testMode ? Icons.science : Icons.shield_moon,
//             delay: 300,
//           ),
//           _buildAnimatedActionButton(
//             tooltip: 'Theme: ${_themeLabel(widget.themeMode)}',
//             onPressed: widget.onToggleTheme,
//             icon:
//                 {
//                   ThemeMode.system: Icons.brightness_auto,
//                   ThemeMode.light: Icons.light_mode,
//                   ThemeMode.dark: Icons.dark_mode,
//                 }[widget.themeMode]!,
//             delay: 400,
//           ),
//           const SizedBox(width: 8),
//         ],
//       ),
//       body: SafeArea(
//         top: false,
//         child: Stack(
//           children: [
//             // Animated gradient background
//             Positioned.fill(
//               child: TweenAnimationBuilder<double>(
//                 tween: Tween(begin: 0.0, end: 1.0),
//                 duration: const Duration(milliseconds: 1200),
//                 builder: (context, value, child) {
//                   return DecoratedBox(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [
//                           Theme.of(
//                             context,
//                           ).colorScheme.primary.withOpacity(0.12 * value),
//                           Theme.of(
//                             context,
//                           ).colorScheme.secondary.withOpacity(0.08 * value),
//                           Colors.transparent,
//                         ],
//                         stops: const [0.0, 0.5, 1.0],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//
//             // Floating orbs
//             ..._buildFloatingOrbs(context),
//
//             Column(
//               children: [
//                 const SizedBox(height: 100),
//
//                 // Search bar
//                 ScaleTransition(
//                   scale: _searchScaleAnimation,
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
//                     child: Hero(
//                       tag: 'search_bar',
//                       child: Material(
//                         color: Colors.transparent,
//                         child: AnimatedContainer(
//                           duration: const Duration(milliseconds: 300),
//                           curve: Curves.easeInOut,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             boxShadow: [
//                               BoxShadow(
//                                 color:
//                                     _searchFocused
//                                         ? Theme.of(
//                                           context,
//                                         ).colorScheme.primary.withOpacity(0.2)
//                                         : Colors.black.withOpacity(0.1),
//                                 blurRadius: _searchFocused ? 20 : 10,
//                                 offset: const Offset(0, 4),
//                                 spreadRadius: _searchFocused ? 2 : 0,
//                               ),
//                             ],
//                           ),
//                           child: TextField(
//                             decoration: InputDecoration(
//                               prefixIcon: AnimatedRotation(
//                                 turns: _searchFocused ? 0.5 : 0,
//                                 duration: const Duration(milliseconds: 400),
//                                 child: Icon(
//                                   Icons.search,
//                                   color:
//                                       _searchFocused
//                                           ? Theme.of(
//                                             context,
//                                           ).colorScheme.primary
//                                           : null,
//                                 ),
//                               ),
//                               suffixIcon:
//                                   query.isNotEmpty
//                                       ? IconButton(
//                                         icon: const Icon(Icons.clear, size: 20),
//                                         onPressed:
//                                             () => setState(() => query = ''),
//                                       )
//                                       : null,
//                               hintText:
//                                   session.isBroker
//                                       ? 'Search in ${session.currentBroker!.name} listings…'
//                                       : 'Search by city, title, or broker…',
//                               hintStyle: TextStyle(
//                                 color: Theme.of(
//                                   context,
//                                 ).colorScheme.onSurface.withOpacity(0.5),
//                               ),
//                               filled: true,
//                               fillColor: Theme.of(
//                                 context,
//                               ).colorScheme.surface.withOpacity(0.9),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                                 borderSide: BorderSide.none,
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                                 borderSide: const BorderSide(
//                                   color: Colors.transparent,
//                                   width: 2,
//                                 ),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                                 borderSide: BorderSide(
//                                   color: Theme.of(context).colorScheme.primary,
//                                   width: 2,
//                                 ),
//                               ),
//                               contentPadding: const EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 16,
//                               ),
//                             ),
//                             onChanged: (v) => setState(() => query = v),
//                             onTap: () => setState(() => _searchFocused = true),
//                             onEditingComplete:
//                                 () => setState(() => _searchFocused = false),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 // Web-only APK banner
//                 if (kIsWeb)
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
//                     child: ConstrainedBox(
//                       constraints: const BoxConstraints(maxWidth: 1200),
//                       child: Card(
//                         child: ListTile(
//                           leading: const Icon(Icons.download_for_offline),
//                           title: const Text('Get the Broker Android App'),
//                           subtitle: const Text(
//                             'Download APK to share properties and your profile with clients',
//                           ),
//                           trailing: const Icon(Icons.open_in_new),
//                           onTap:
//                               () => launchUrlString(
//                                 'https://propertybroker-test.web.app/apk/app-release.apk',
//                                 mode: LaunchMode.externalApplication,
//                               ),
//                         ),
//                       ),
//                     ),
//                   ),
//
//                 // Results count
//                 if (query.isNotEmpty || session.isBroker)
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 6,
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.filter_list,
//                           size: 16,
//                           color: Theme.of(
//                             context,
//                           ).colorScheme.onSurface.withOpacity(0.6),
//                         ),
//                         const SizedBox(width: 8),
//                         Text(
//                           session.isBroker
//                               ? '${filtered.length} listing(s) • ${session.currentBroker!.name}'
//                               : '${filtered.length} ${filtered.length == 1 ? 'property' : 'properties'} found',
//                           style: TextStyle(
//                             color: Theme.of(
//                               context,
//                             ).colorScheme.onSurface.withOpacity(0.6),
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                 // Grid
//                 Expanded(
//                   child: LayoutBuilder(
//                     builder: (context, c) {
//                       final isWide = c.maxWidth > 1100;
//                       final cross =
//                           isWide
//                               ? 4
//                               : (c.maxWidth > 800
//                                   ? 3
//                                   : (c.maxWidth > 600 ? 2 : 1));
//                       final aspect =
//                           isWide ? 1.2 : (c.maxWidth > 800 ? 1.0 : 0.72);
//
//                       return GridView.builder(
//                         padding: const EdgeInsets.all(16),
//                         physics: const BouncingScrollPhysics(),
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: cross,
//                           childAspectRatio: aspect,
//                           crossAxisSpacing: 16,
//                           mainAxisSpacing: 16,
//                         ),
//                         itemCount: filtered.length,
//                         itemBuilder: (_, i) {
//                           return TweenAnimationBuilder<double>(
//                             tween: Tween(begin: 0.0, end: 1.0),
//                             duration: Duration(
//                               milliseconds: 400 + (i * 50).clamp(0, 800),
//                             ),
//                             curve: Curves.easeOutCubic,
//                             builder: (context, value, child) {
//                               return Transform.scale(
//                                 scale: 0.8 + (0.2 * value),
//                                 child: Opacity(opacity: value, child: child),
//                               );
//                             },
//                             child: PropertyCard(
//                               property: filtered[i],
//                               onBrokerTap:
//                                   () => Navigator.push(
//                                     context,
//                                     PageRouteBuilder(
//                                       pageBuilder:
//                                           (context, animation, _) =>
//                                               BrokerProfilePage(
//                                                 broker: filtered[i].broker,
//                                               ),
//                                       transitionsBuilder: (
//                                         context,
//                                         animation,
//                                         __,
//                                         child,
//                                       ) {
//                                         return FadeTransition(
//                                           opacity: animation,
//                                           child: SlideTransition(
//                                             position: Tween<Offset>(
//                                               begin: const Offset(0.1, 0),
//                                               end: Offset.zero,
//                                             ).animate(
//                                               CurvedAnimation(
//                                                 parent: animation,
//                                                 curve: Curves.easeOutCubic,
//                                               ),
//                                             ),
//                                             child: child,
//                                           ),
//                                         );
//                                       },
//                                       transitionDuration: const Duration(
//                                         milliseconds: 400,
//                                       ),
//                                     ),
//                                   ),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//
//             // Test mode banner
//             if (widget.testMode)
//               Positioned(
//                 top: 0,
//                 left: 0,
//                 right: 0,
//                 child: TweenAnimationBuilder<double>(
//                   tween: Tween(begin: -80.0, end: 0.0),
//                   duration: const Duration(milliseconds: 600),
//                   curve: Curves.easeOutBack,
//                   builder:
//                       (context, value, child) => Transform.translate(
//                         offset: Offset(0, value),
//                         child: child,
//                       ),
//                   child: Material(
//                     color: Colors.amber.withOpacity(0.95),
//                     elevation: 6,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 6,
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Icon(Icons.science, size: 16),
//                           SizedBox(width: 8),
//                           Text(
//                             'Test Mode: actions are simulated only',
//                             style: TextStyle(fontWeight: FontWeight.w600),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // ==== Role/Login bottom sheet ====
//   Future<void> _openBrokerLoginSheet(BuildContext context) async {
//     final controller = TextEditingController();
//     final pinController = TextEditingController();
//     Broker? selected;
//
//     await showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       showDragHandle: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//       ),
//       builder: (context) {
//         final media = MediaQuery.of(context);
//         return Padding(
//           padding: EdgeInsets.only(
//             left: 16,
//             right: 16,
//             top: 12,
//             bottom: media.viewInsets.bottom + 16,
//           ),
//           child: StatefulBuilder(
//             builder: (context, setSheet) {
//               final q = controller.text.toLowerCase();
//               final list =
//                   mockBrokers
//                       .where(
//                         (b) =>
//                             b.name.toLowerCase().contains(q) ||
//                             b.email.toLowerCase().contains(q) ||
//                             b.phone.contains(q),
//                       )
//                       .toList();
//
//               return Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Text(
//                     'Broker Login',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
//                   ),
//                   const SizedBox(height: 12),
//                   TextField(
//                     controller: controller,
//                     decoration: const InputDecoration(
//                       prefixIcon: Icon(Icons.search),
//                       hintText: 'Search broker by name, email, or phone',
//                       border: OutlineInputBorder(),
//                     ),
//                     onChanged: (_) => setSheet(() {}),
//                   ),
//                   const SizedBox(height: 12),
//                   ConstrainedBox(
//                     constraints: const BoxConstraints(maxHeight: 260),
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: list.length,
//                       itemBuilder: (_, i) {
//                         final b = list[i];
//                         final isSel = selected?.id == b.id;
//                         return ListTile(
//                           leading: CircleAvatar(
//                             backgroundImage: NetworkImage(b.photoUrl),
//                           ),
//                           title: Text(b.name),
//                           subtitle: Text('${b.email} • ${b.phone}'),
//                           trailing:
//                               isSel
//                                   ? const Icon(
//                                     Icons.check_circle,
//                                     color: Colors.green,
//                                   )
//                                   : null,
//                           onTap: () => setSheet(() => selected = b),
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   TextField(
//                     controller: pinController,
//                     keyboardType: TextInputType.number,
//                     maxLength: 4,
//                     obscureText: true,
//                     decoration: const InputDecoration(
//                       prefixIcon: Icon(Icons.lock),
//                       hintText: 'Enter 4-digit PIN',
//                       counterText: '',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: OutlinedButton(
//                           onPressed: () => Navigator.pop(context),
//                           child: const Text('Cancel'),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: ElevatedButton.icon(
//                           onPressed:
//                               selected == null
//                                   ? null
//                                   : () {
//                                     final ok = session.loginBroker(
//                                       selected!,
//                                       pinController.text.trim(),
//                                     );
//                                     if (ok) {
//                                       Navigator.pop(context);
//                                       ScaffoldMessenger.of(
//                                         context,
//                                       ).showSnackBar(
//                                         SnackBar(
//                                           content: Text(
//                                             'Welcome, ${selected!.name}!',
//                                           ),
//                                         ),
//                                       );
//                                     } else {
//                                       ScaffoldMessenger.of(
//                                         context,
//                                       ).showSnackBar(
//                                         const SnackBar(
//                                           content: Text('Invalid PIN'),
//                                         ),
//                                       );
//                                     }
//                                   },
//                           icon: const Icon(Icons.login),
//                           label: const Text('Login'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildAnimatedActionButton({
//     required String tooltip,
//     required VoidCallback onPressed,
//     required IconData icon,
//     required int delay,
//   }) {
//     return TweenAnimationBuilder<double>(
//       tween: Tween(begin: 0.0, end: 1.0),
//       duration: Duration(milliseconds: 600 + delay),
//       curve: Curves.easeOutBack,
//       builder: (context, value, child) {
//         return Transform.scale(
//           scale: value,
//           child: Opacity(opacity: value, child: child),
//         );
//       },
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 4),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           boxShadow: [
//             BoxShadow(
//               color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
//               blurRadius: 8,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: IconButton(
//           tooltip: tooltip,
//           onPressed: onPressed,
//           icon: Icon(icon),
//           style: IconButton.styleFrom(
//             backgroundColor: Theme.of(
//               context,
//             ).colorScheme.surface.withOpacity(0.9),
//             foregroundColor: Theme.of(context).colorScheme.primary,
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<Widget> _buildFloatingOrbs(BuildContext context) {
//     return [
//       Positioned(
//         top: 150,
//         right: -50,
//         child: _orb(
//           context,
//           size: 200,
//           color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
//           up: false,
//         ),
//       ),
//       Positioned(
//         bottom: 100,
//         left: -80,
//         child: _orb(
//           context,
//           size: 250,
//           color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
//           up: true,
//         ),
//       ),
//     ];
//   }
//
//   Widget _orb(
//     BuildContext context, {
//     required double size,
//     required Color color,
//     required bool up,
//   }) {
//     return TweenAnimationBuilder<double>(
//       tween: Tween(begin: 0.0, end: 1.0),
//       duration: Duration(seconds: up ? 4 : 3),
//       builder: (context, value, child) {
//         return Transform.translate(
//           offset: Offset(0, (up ? -30 : 20) * (1 - value)),
//           child: Opacity(opacity: (up ? 0.2 : 0.3) * value, child: child),
//         );
//       },
//       child: Container(
//         width: size,
//         height: size,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           gradient: RadialGradient(colors: [color, Colors.transparent]),
//         ),
//       ),
//     );
//   }
//
//   String _themeLabel(ThemeMode mode) =>
//       mode == ThemeMode.system
//           ? 'System'
//           : (mode == ThemeMode.dark ? 'Dark' : 'Light');
// }
//
// // === Small role pill in the header ===
// class _RolePill extends StatelessWidget {
//   const _RolePill({
//     required this.session,
//     required this.onPickAdmin,
//     required this.onPickBroker,
//     required this.onLogout,
//   });
//
//   final Session session;
//   final VoidCallback onPickAdmin;
//   final VoidCallback onPickBroker;
//   final VoidCallback onLogout;
//
//   @override
//   Widget build(BuildContext context) {
//     final label =
//         session.isBroker
//             ? session.currentBroker!.name
//             : (session.isAdmin ? 'Admin' : 'Guest');
//
//     return PopupMenuButton<String>(
//       tooltip: 'Select role',
//       onSelected: (v) {
//         switch (v) {
//           case 'admin':
//             onPickAdmin();
//             break;
//           case 'broker':
//             onPickBroker();
//             break;
//           case 'logout':
//             onLogout();
//             break;
//         }
//       },
//       itemBuilder:
//           (context) => [
//             const PopupMenuItem(
//               value: 'admin',
//               child: ListTile(
//                 leading: Icon(Icons.shield),
//                 title: Text('Admin (see all)'),
//               ),
//             ),
//             const PopupMenuItem(
//               value: 'broker',
//               child: ListTile(
//                 leading: Icon(Icons.person),
//                 title: Text('Broker login'),
//               ),
//             ),
//             if (session.role != AppRole.guest)
//               const PopupMenuItem(
//                 value: 'logout',
//                 child: ListTile(
//                   leading: Icon(Icons.logout),
//                   title: Text('Logout'),
//                 ),
//               ),
//           ],
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(999),
//           border: Border.all(
//             color: Theme.of(context).colorScheme.outlineVariant,
//           ),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               session.isBroker
//                   ? Icons.verified_user
//                   : (session.isAdmin
//                       ? Icons.admin_panel_settings
//                       : Icons.person),
//               size: 16,
//             ),
//             const SizedBox(width: 6),
//             Text(label, overflow: TextOverflow.ellipsis),
//             const SizedBox(width: 4),
//             const Icon(Icons.expand_more, size: 16),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../models/mock_data.dart';
import '../widgets/property_card.dart';
import '../models/broker.dart';
import '../state/session.dart';
import 'broker_profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.testMode,
    required this.onToggleTestMode,
    required this.themeMode,
    required this.onToggleTheme,
  });

  final bool testMode;
  final VoidCallback onToggleTestMode;
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  String query = '';
  late final AnimationController _headerController = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
  late final Animation<double> _headerFade = CurvedAnimation(parent: _headerController, curve: Curves.easeOut);
  late final Animation<Offset> _headerSlide = Tween(begin: const Offset(0, -0.4), end: Offset.zero).animate(CurvedAnimation(parent: _headerController, curve: Curves.easeOutCubic));
  bool _searchFocused = false;

  final Session session = Session();

  @override
  void initState() {
    super.initState();
    _headerController.forward();
    session.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _headerController.dispose();
    session.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final base = session.isBroker
        ? mockProperties.where((p) => p.broker.id == session.currentBroker!.id).toList()
        : mockProperties;

    final filtered = base.where((p) {
      final q = query.toLowerCase();
      return p.title.toLowerCase().contains(q) ||
          p.city.toLowerCase().contains(q) ||
          p.broker.name.toLowerCase().contains(q);
    }).toList();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, elevation: 0,
        title: FadeTransition(
          opacity: _headerFade,
          child: SlideTransition(
            position: _headerSlide,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                    ]),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.home_work, size: 16),
                ),
                const SizedBox(width: 10),
                const Text('Discover Properties', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 10),
                _RolePill(
                  session: session,
                  onPickAdmin: () => session.setAdmin(),
                  onPickBroker: () => _openBrokerLoginSheet(context),
                  onLogout: () => session.logout(),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            tooltip: widget.testMode ? 'Test Mode ON' : 'Test Mode OFF',
            onPressed: widget.onToggleTestMode,
            icon: widget.testMode ? const Icon(Icons.science) : const Icon(Icons.shield_moon),
          ),
          IconButton(
            tooltip: 'Theme',
            onPressed: widget.onToggleTheme,
            icon: {
              ThemeMode.system: const Icon(Icons.brightness_auto),
              ThemeMode.light: const Icon(Icons.light_mode),
              ThemeMode.dark: const Icon(Icons.dark_mode),
            }[widget.themeMode]!,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            const SizedBox(height: 100),
            // Search
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: _searchFocused ? Theme.of(context).colorScheme.primary : null),
                  hintText: session.isBroker
                      ? 'Search in ${session.currentBroker!.name} listings…'
                      : 'Search by city, title, or broker…',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
                onChanged: (v) => setState(() => query = v),
                onTap: () => setState(() => _searchFocused = true),
                onEditingComplete: () => setState(() => _searchFocused = false),
              ),
            ),

            if (query.isNotEmpty || session.isBroker)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: Row(
                  children: [
                    const Icon(Icons.filter_list, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      session.isBroker
                          ? '${filtered.length} listing(s) • ${session.currentBroker!.name}'
                          : '${filtered.length} ${filtered.length == 1 ? 'property' : 'properties'} found',
                    ),
                  ],
                ),
              ),

            // Grid
            Expanded(
              child: LayoutBuilder(
                builder: (context, c) {
                  final isWide = c.maxWidth > 1100;
                  final cross = isWide ? 4 : (c.maxWidth > 800 ? 3 : (c.maxWidth > 600 ? 2 : 1));
                  final aspect = isWide ? 1.2 : (c.maxWidth > 800 ? 1.0 : 0.72);
                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: cross,
                      childAspectRatio: aspect,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: filtered.length,
                    itemBuilder: (_, i) {
                      final p = filtered[i];
                      return PropertyCard(
                        property: p,
                        onBrokerTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => BrokerProfilePage(broker: p.broker)),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openBrokerLoginSheet(BuildContext context) async {
    final controller = TextEditingController();
    Broker? selected;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        final media = MediaQuery.of(context);
        return Padding(
          padding: EdgeInsets.fromLTRB(16, 12, 16, media.viewInsets.bottom + 16),
          child: StatefulBuilder(
            builder: (context, setSheet) {
              final q = controller.text.toLowerCase();
              final list = mockBrokers.where((b) =>
              b.name.toLowerCase().contains(q) ||
                  b.email.toLowerCase().contains(q) ||
                  b.phone.contains(q),
              ).toList();

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Broker Login', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search broker by name, email, or phone',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (_) => setSheet(() {}),
                  ),
                  const SizedBox(height: 12),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 300),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (_, i) {
                        final b = list[i];
                        final isSel = selected?.id == b.id;
                        return ListTile(
                          leading: CircleAvatar(backgroundImage: NetworkImage(b.photoUrl)),
                          title: Text(b.name),
                          subtitle: Text('${b.email} • ${b.phone}'),
                          trailing: isSel ? const Icon(Icons.check_circle, color: Colors.green) : null,
                          onTap: () => setSheet(() => selected = b),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: selected == null
                              ? null
                              : () {
                            session.loginBroker(selected!);
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Welcome, ${selected!.name}!')),
                            );
                          },
                          icon: const Icon(Icons.login),
                          label: const Text('Login'),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class _RolePill extends StatelessWidget {
  const _RolePill({
    required this.session,
    required this.onPickAdmin,
    required this.onPickBroker,
    required this.onLogout,
  });

  final Session session;
  final VoidCallback onPickAdmin;
  final VoidCallback onPickBroker;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    final label = session.isBroker ? session.currentBroker!.name : (session.isAdmin ? 'Admin' : 'Guest');

    return PopupMenuButton<String>(
      tooltip: 'Select role',
      onSelected: (v) {
        switch (v) {
          case 'admin': onPickAdmin(); break;
          case 'broker': onPickBroker(); break;
          case 'logout': onLogout(); break;
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(value: 'admin',  child: ListTile(leading: Icon(Icons.shield), title: Text('Admin (see all)'))),
        const PopupMenuItem(value: 'broker', child: ListTile(leading: Icon(Icons.person), title: Text('Broker login'))),
        if (session.role != AppRole.guest)
          const PopupMenuItem(value: 'logout', child: ListTile(leading: Icon(Icons.logout), title: Text('Logout'))),
      ],
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(session.isBroker ? Icons.verified_user : (session.isAdmin ? Icons.admin_panel_settings : Icons.person), size: 16),
            const SizedBox(width: 6),
            Text(label, overflow: TextOverflow.ellipsis),
            const SizedBox(width: 4),
            const Icon(Icons.expand_more, size: 16),
          ],
        ),
      ),
    );
  }
}
