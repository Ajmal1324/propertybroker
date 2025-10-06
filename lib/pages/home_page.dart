// =================================
// FILE: lib/pages/home_page.dart
// =================================
import 'package:flutter/material.dart';
// import '../data/mock_data.dart';
import '../models/mock_data.dart';
import '../widgets/property_card.dart';
import 'broker_profile_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.testMode, required this.onToggleTestMode, required this.themeMode, required this.onToggleTheme});
  final bool testMode; final VoidCallback onToggleTestMode; final ThemeMode themeMode; final VoidCallback onToggleTheme;
  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  String query = '';
  @override
  Widget build(BuildContext context) {
    final filtered = mockProperties.where((p) =>
    p.title.toLowerCase().contains(query.toLowerCase()) ||
        p.city.toLowerCase().contains(query.toLowerCase()) ||
        p.broker.name.toLowerCase().contains(query.toLowerCase())).toList();


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Discover Properties'),
        actions: [
          IconButton(
            tooltip: widget.testMode ? 'Test Mode ON' : 'Test Mode OFF',
            onPressed: widget.onToggleTestMode,
            icon: Icon(widget.testMode ? Icons.science : Icons.shield_moon),
          ),
          IconButton(
            tooltip: 'Theme: ${_themeLabel(widget.themeMode)}',
            onPressed: widget.onToggleTheme,
            icon: Icon({ThemeMode.system: Icons.brightness_auto, ThemeMode.light: Icons.light_mode, ThemeMode.dark: Icons.dark_mode}[widget.themeMode]),
          ),
        ],
      ),
      body: Stack(children: [
// Gradient background
      Positioned.fill(child: DecoratedBox(
      decoration: BoxDecoration(
      gradient: LinearGradient(
      begin: Alignment.topLeft, end: Alignment.bottomRight,
        colors: [Theme.of(context).colorScheme.primary.withOpacity(0.12), Colors.transparent],
      ),
    ),
    )),
    Column(children: [
    const SizedBox(height: 100),
    Padding(
    padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
    child: TextField(
    decoration: InputDecoration(
    prefixIcon: const Icon(Icons.search),
    hintText: 'Search by city, title, or broker…',
    filled: true,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
    ),
    onChanged: (v) => setState(() => query = v),
    ),
    ),
      Expanded(child: LayoutBuilder(builder: (context, c) {
        final isWide = c.maxWidth > 1100;
        final cross = isWide ? 4 : (c.maxWidth > 800 ? 3 : (c.maxWidth > 600 ? 2 : 1));
        final aspect = isWide ? 1.2 : (c.maxWidth > 800 ? 1.0 : 0.72);
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: cross, childAspectRatio: aspect, crossAxisSpacing: 16, mainAxisSpacing: 16,
          ),
          itemCount: filtered.length,
          itemBuilder: (_, i) => PropertyCard(
            property: filtered[i],
            onBrokerTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BrokerProfilePage(broker: filtered[i].broker))),
          ),
        );
      }))
    ]),
        if (widget.testMode)
          Positioned(
            top: 0, left: 0, right: 0,
            child: Material(color: Colors.amber.withOpacity(0.95), child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
                Icon(Icons.science, size: 18), SizedBox(width: 8), Text('Test Mode: actions are simulated only')
              ]),
            )),
          ),
      ]),
    );
  }


  String _themeLabel(ThemeMode mode) => mode == ThemeMode.system ? 'System' : (mode == ThemeMode.dark ? 'Dark' : 'Light');
}