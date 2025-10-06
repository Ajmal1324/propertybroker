// =================================
// FILE: lib/models/broker.dart
// =================================
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