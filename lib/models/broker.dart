// lib/models/broker.dart
class Broker {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String photoUrl;
  final double rating;
  final int dealsClosed;

  /// NEW: simple 4-digit PIN for demo/broker login
  final String pin;

  const Broker({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.photoUrl,
    required this.rating,
    required this.dealsClosed,
    required this.pin,
  });

  Broker copyWith({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? photoUrl,
    double? rating,
    int? dealsClosed,
    String? pin,
  }) {
    return Broker(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      rating: rating ?? this.rating,
      dealsClosed: dealsClosed ?? this.dealsClosed,
      pin: pin ?? this.pin,
    );
  }
}
