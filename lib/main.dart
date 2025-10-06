import 'package:flutter/material.dart';

// --------------------------------------------------
// Flutter Property & Broker Web App (improved)
// - Fixes RenderFlex overflow in cards
// - Adds Dark/Light Mode toggle
// - Polished UI, more brokers & properties
// - Test Mode banner & simulated actions
// --------------------------------------------------

void main() {
  runApp(const PropertyApp());
}

class PropertyApp extends StatefulWidget {
  const PropertyApp({super.key});

  @override
  State<PropertyApp> createState() => _PropertyAppState();
}

class _PropertyAppState extends State<PropertyApp> {
  bool testMode = true;
  ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    final seed = const Color(0xFF2563EB);
    return MaterialApp(
      title: 'Property & Broker',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.light),
        useMaterial3: true,
        cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.dark),
        useMaterial3: true,
        cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      routes: {
        '/': (_) => HomeScreen(
          testMode: testMode,
          onToggleTestMode: () => setState(() => testMode = !testMode),
          themeMode: themeMode,
          onToggleTheme: () => setState(() {
            themeMode = themeMode == ThemeMode.dark
                ? ThemeMode.light
                : (themeMode == ThemeMode.light ? ThemeMode.system : ThemeMode.dark);
          }),
        ),
      },
      onGenerateRoute: (settings) {
        if (settings.name == PropertyDetailScreen.routeName) {
          final prop = settings.arguments as Property;
          return MaterialPageRoute(
            builder: (_) => PropertyDetailScreen(property: prop, testMode: testMode),
          );
        }
        if (settings.name == BrokerProfileScreen.routeName) {
          final broker = settings.arguments as Broker;
          return MaterialPageRoute(
            builder: (_) => BrokerProfileScreen(broker: broker, testMode: testMode),
          );
        }
        return null;
      },
    );
  }
}

// -------------------------------
// Models & Mock Data
// -------------------------------
class Property {
  final String id;
  final String title;
  final String address;
  final String city;
  final double price;
  final double areaSqft;
  final int beds;
  final int baths;
  final String imageUrl;
  final Broker broker;

  const Property({
    required this.id,
    required this.title,
    required this.address,
    required this.city,
    required this.price,
    required this.areaSqft,
    required this.beds,
    required this.baths,
    required this.imageUrl,
    required this.broker,
  });
}

class Broker {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String photoUrl;
  final double rating; // 0..5
  final int dealsClosed;

  const Broker({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.photoUrl,
    required this.rating,
    required this.dealsClosed,
  });
}

const mockBrokers = <Broker>[
  Broker(
    id: 'b1',
    name: 'Aarav Mehta',
    phone: '+91 98765 43210',
    email: 'aarav@example.com',
    photoUrl: 'https://images.unsplash.com/photo-1607746882042-944635dfe10e',
    rating: 4.7,
    dealsClosed: 134,
  ),
  Broker(
    id: 'b2',
    name: 'Sara Khan',
    phone: '+91 99870 11223',
    email: 'sara@example.com',
    photoUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2',
    rating: 4.5,
    dealsClosed: 96,
  ),
  Broker(
    id: 'b3',
    name: 'Vikram Patel',
    phone: '+91 90000 11111',
    email: 'vikram@example.com',
    photoUrl: 'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c',
    rating: 4.8,
    dealsClosed: 162,
  ),
  Broker(
    id: 'b4',
    name: 'Neha Sharma',
    phone: '+91 91234 56789',
    email: 'neha@example.com',
    photoUrl: 'https://images.unsplash.com/photo-1545996124-0501ebae84d0',
    rating: 4.6,
    dealsClosed: 120,
  ),
  Broker(
    id: 'b5',
    name: 'Rohan Gupta',
    phone: '+91 98765 00000',
    email: 'rohan@example.com',
    photoUrl: 'https://images.unsplash.com/photo-1599566150163-29194dcaad36',
    rating: 4.4,
    dealsClosed: 88,
  ),
];

final mockProperties = <Property>[
  Property(
    id: 'p1',
    title: 'Modern 3BHK Apartment',
    address: '12 Palm Avenue',
    city: 'Mumbai',
    price: 24500000,
    areaSqft: 1450,
    beds: 3,
    baths: 2,
    imageUrl: 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85',
    broker: mockBrokers[0],
  ),
  Property(
    id: 'p2',
    title: 'Lakeview Villa',
    address: '88 Serene Lane',
    city: 'Bengaluru',
    price: 56000000,
    areaSqft: 3200,
    beds: 4,
    baths: 4,
    imageUrl: 'https://images.unsplash.com/photo-1600585154526-990dced4db0d',
    broker: mockBrokers[1],
  ),
  Property(
    id: 'p3',
    title: 'Cozy Studio Loft',
    address: '5 Market Street',
    city: 'Pune',
    price: 8500000,
    areaSqft: 520,
    beds: 1,
    baths: 1,
    imageUrl: 'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267',
    broker: mockBrokers[0],
  ),
  Property(
    id: 'p4',
    title: 'Penthouse with Terrace',
    address: '21 Skyline Road',
    city: 'Hyderabad',
    price: 79000000,
    areaSqft: 4100,
    beds: 4,
    baths: 5,
    imageUrl: 'https://images.unsplash.com/photo-1505691938895-1758d7feb511',
    broker: mockBrokers[2],
  ),
  Property(
    id: 'p5',
    title: 'Smart 2BHK Condo',
    address: '44 Tech Park',
    city: 'Gurugram',
    price: 15500000,
    areaSqft: 980,
    beds: 2,
    baths: 2,
    imageUrl: 'https://images.unsplash.com/photo-1515263487990-61b07816b324',
    broker: mockBrokers[3],
  ),
  Property(
    id: 'p6',
    title: 'Beachside Bungalow',
    address: '7 Ocean Drive',
    city: 'Goa',
    price: 42500000,
    areaSqft: 2400,
    beds: 3,
    baths: 3,
    imageUrl: 'https://images.unsplash.com/photo-1501183638710-841dd1904471',
    broker: mockBrokers[4],
  ),
  Property(
    id: 'p7',
    title: 'Garden Duplex',
    address: '18 Green Street',
    city: 'Ahmedabad',
    price: 21000000,
    areaSqft: 1650,
    beds: 3,
    baths: 3,
    imageUrl: 'https://images.unsplash.com/photo-1493809842364-78817add7ffb',
    broker: mockBrokers[2],
  ),
  Property(
    id: 'p8',
    title: 'Heritage Haveli',
    address: '2 Fort Lane',
    city: 'Jaipur',
    price: 98000000,
    areaSqft: 6200,
    beds: 6,
    baths: 6,
    imageUrl: 'https://images.unsplash.com/photo-1554995207-c18c203602cb',
    broker: mockBrokers[3],
  ),
  Property(
    id: 'p9',
    title: 'Riverside Cottage',
    address: '13 Willow Bend',
    city: 'Kochi',
    price: 18500000,
    areaSqft: 1320,
    beds: 2,
    baths: 2,
    imageUrl: 'https://images.unsplash.com/photo-1484154218962-a197022b5858',
    broker: mockBrokers[4],
  ),
  Property(
    id: 'p10',
    title: 'City Center Flat',
    address: '101 Central Plaza',
    city: 'Chennai',
    price: 12500000,
    areaSqft: 870,
    beds: 2,
    baths: 1,
    imageUrl: 'https://images.unsplash.com/photo-1536376072261-38c75010e6c9',
    broker: mockBrokers[1],
  ),
];

// -------------------------------
// Home Screen (Property list)
// -------------------------------
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.testMode, required this.onToggleTestMode, required this.themeMode, required this.onToggleTheme});
  final bool testMode;
  final VoidCallback onToggleTestMode;
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filtered = mockProperties.where((p) {
      return p.title.toLowerCase().contains(query.toLowerCase()) ||
          p.city.toLowerCase().contains(query.toLowerCase()) ||
          p.broker.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover Properties'),
        actions: [
          Tooltip(
            message: widget.testMode ? 'Test Mode ON' : 'Test Mode OFF',
            child: IconButton(
              onPressed: widget.onToggleTestMode,
              icon: Icon(widget.testMode ? Icons.science : Icons.shield_moon),
            ),
          ),
          Tooltip(
            message: 'Theme: ${_themeLabel(widget.themeMode)}',
            child: IconButton(
              onPressed: widget.onToggleTheme,
              icon: Icon({
                ThemeMode.system: Icons.brightness_auto,
                ThemeMode.light: Icons.light_mode,
                ThemeMode.dark: Icons.dark_mode,
              }[widget.themeMode]),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search by city, title, or broker…',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (v) => setState(() => query = v),
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth > 1000;
                    final cross = isWide ? 3 : (constraints.maxWidth > 680 ? 2 : 1);
                    // Make tiles taller on narrow screens to avoid overflow
                    final aspect = isWide
                        ? 1.25 // wider, shorter
                        : (constraints.maxWidth > 680 ? 1.0 : 0.72); // taller cells on phones
                    return GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: cross,
                        childAspectRatio: aspect,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: filtered.length,
                      itemBuilder: (_, i) => PropertyCard(
                        property: filtered[i],
                        onTap: () => Navigator.pushNamed(
                          context,
                          PropertyDetailScreen.routeName,
                          arguments: filtered[i],
                        ),
                        onBrokerTap: () => Navigator.pushNamed(
                          context,
                          BrokerProfileScreen.routeName,
                          arguments: filtered[i].broker,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          if (widget.testMode)
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: TestModeBanner(),
            ),
        ],
      ),
    );
  }

  String _themeLabel(ThemeMode mode) =>
      mode == ThemeMode.system ? 'System' : (mode == ThemeMode.dark ? 'Dark' : 'Light');
}

class TestModeBanner extends StatelessWidget {
  const TestModeBanner({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.amber.withOpacity(0.95),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.science, size: 18),
            SizedBox(width: 8),
            Text('Test Mode: actions are simulated only')
          ],
        ),
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  const PropertyCard({super.key, required this.property, required this.onTap, required this.onBrokerTap});
  final Property property;
  final VoidCallback onTap;
  final VoidCallback onBrokerTap;

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormatHelper.inr(property.price);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(property.imageUrl, fit: BoxFit.cover),
            ),
            // Make the lower content flexible and scrollable to prevent overflow
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: LayoutBuilder(
                  builder: (context, c) {
                    return SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(), // avoid nested scroll conflicts
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            property.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${property.address}, ${property.city}',
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 12,
                            runSpacing: 8,
                            children: [
                              _Chip(icon: Icons.king_bed, label: '${property.beds} Beds'),
                              _Chip(icon: Icons.bathtub, label: '${property.baths} Baths'),
                              _Chip(icon: Icons.aspect_ratio, label: '${property.areaSqft.toStringAsFixed(0)} sqft'),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                currency,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w800),
                              ),
                              TextButton.icon(
                                onPressed: onBrokerTap,
                                icon: const Icon(Icons.person),
                                label: Text(
                                  property.broker.name,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(icon, size: 16), const SizedBox(width: 6), Text(label)],
      ),
    );
  }
}

// -------------------------------
// Property Detail (ID card style)
// -------------------------------
class PropertyDetailScreen extends StatelessWidget {
  static const routeName = '/property';
  const PropertyDetailScreen({super.key, required this.property, required this.testMode});
  final Property property;
  final bool testMode;

  @override
  Widget build(BuildContext context) {
    final priceStr = NumberFormatHelper.inr(property.price);

    return Scaffold(
      appBar: AppBar(title: const Text('Property Detail')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: LayoutBuilder(
              builder: (context, c) {
                final isWide = c.maxWidth > 900;
                return Flex(
                  direction: isWide ? Axis.horizontal : Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Photo
                    Expanded(
                      flex: 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: AspectRatio(
                          aspectRatio: 16 / 10,
                          child: Image.network(property.imageUrl, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16, height: 16),
                    // ID Card style
                    Expanded(
                      flex: 5,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(property.broker.photoUrl),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          property.title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(fontWeight: FontWeight.w800),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          '${property.address}, ${property.city}',
                                          style: Theme.of(context).textTheme.bodySmall,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 16),
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: [
                                  _InfoTile(icon: Icons.currency_rupee, label: 'Price', value: priceStr),
                                  _InfoTile(icon: Icons.aspect_ratio, label: 'Area', value: '${property.areaSqft.toStringAsFixed(0)} sqft'),
                                  _InfoTile(icon: Icons.king_bed, label: 'Bedrooms', value: '${property.beds}'),
                                  _InfoTile(icon: Icons.bathtub, label: 'Bathrooms', value: '${property.baths}'),
                                  _InfoTile(icon: Icons.confirmation_number, label: 'Property ID', value: property.id),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: testMode
                                        ? () => _showSnack(context, 'Test Mode: Contact simulated')
                                        : () {},
                                    icon: const Icon(Icons.phone),
                                    label: const Text('Contact Broker'),
                                  ),
                                  const SizedBox(width: 12),
                                  OutlinedButton.icon(
                                    onPressed: () => Navigator.pushNamed(
                                      context,
                                      BrokerProfileScreen.routeName,
                                      arguments: property.broker,
                                    ),
                                    icon: const Icon(Icons.person),
                                    label: const Text('View Broker Profile'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _showSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({required this.icon, required this.label, required this.value});
  final IconData icon;
  final String label;
  final String value;

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

// -------------------------------
// Broker Profile Screen
// -------------------------------
class BrokerProfileScreen extends StatelessWidget {
  static const routeName = '/broker';
  const BrokerProfileScreen({super.key, required this.broker, required this.testMode});
  final Broker broker;
  final bool testMode;

  @override
  Widget build(BuildContext context) {
    final listed = mockProperties.where((p) => p.broker.id == broker.id).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Broker Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(radius: 48, backgroundImage: NetworkImage(broker.photoUrl)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            broker.name,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(children: [
                            Icon(Icons.star, size: 18, color: Colors.amber.shade700),
                            const SizedBox(width: 4),
                            Text('${broker.rating} • ${broker.dealsClosed} deals closed'),
                          ]),
                          const SizedBox(height: 12),
                          Wrap(spacing: 12, runSpacing: 8, children: [
                            _ContactPill(icon: Icons.phone, label: broker.phone, onTap: () => _copy(context, broker.phone)),
                            _ContactPill(icon: Icons.email, label: broker.email, onTap: () => _copy(context, broker.email)),
                          ]),
                          const SizedBox(height: 12),
                          ElevatedButton.icon(
                            onPressed: testMode ? () => _showSnack(context, 'Test Mode: Meeting request simulated') : () {},
                            icon: const Icon(Icons.event_available),
                            label: const Text('Request Meeting'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text('Listed Properties', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
                const SizedBox(height: 12),
                LayoutBuilder(
                  builder: (context, c) {
                    final isWide = c.maxWidth > 900;
                    final cross = isWide ? 3 : (c.maxWidth > 600 ? 2 : 1);
                    final aspect = isWide ? 1.25 : (c.maxWidth > 600 ? 1.0 : 0.72);
                    final listedProps = listed.isEmpty ? mockProperties.take(3).toList() : listed;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: cross,
                        childAspectRatio: aspect,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: listedProps.length,
                      itemBuilder: (_, i) => PropertyCard(
                        property: listedProps[i],
                        onTap: () => Navigator.pushNamed(context, PropertyDetailScreen.routeName, arguments: listedProps[i]),
                        onBrokerTap: () {},
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _copy(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Copied: $text')));
  }

  void _showSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}

class _ContactPill extends StatelessWidget {
  const _ContactPill({required this.icon, required this.label, this.onTap});
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [Icon(icon, size: 16), const SizedBox(width: 6), Text(label)],
        ),
      ),
    );
  }
}

// -------------------------------
// Helpers
// -------------------------------
class NumberFormatHelper {
  static String inr(double amount) {
    // Simple INR formatter (compact). For production, use intl package.
    if (amount >= 10000000) {
      return '₹${(amount / 10000000).toStringAsFixed(amount % 10000000 == 0 ? 0 : 1)} Cr';
    } else if (amount >= 100000) {
      return '₹${(amount / 100000).toStringAsFixed(amount % 100000 == 0 ? 0 : 1)} L';
    }
    return '₹${amount.toStringAsFixed(0)}';
  }
}