import 'broker.dart';

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
  final List<String> gallery;
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
    required this.gallery,
    required this.broker,
  });
}
