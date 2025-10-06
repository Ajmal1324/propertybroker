// // // // =================================
// // // // FILE: lib/data/mock_data.dart
// // // // =================================
// // // import '../models/broker.dart';
// // // import '../models/property.dart';
// // //
// // // const mockBrokers = <Broker>[
// // //   Broker(
// // //     id: 'b1',
// // //     name: 'Aarav Mehta',
// // //     phone: '+91 98765 43210',
// // //     email: 'aarav@example.com',
// // //     photoUrl: 'https://images.unsplash.com/photo-1607746882042-944635dfe10e',
// // //     rating: 4.7,
// // //     dealsClosed: 134,
// // //   ),
// // //   Broker(
// // //     id: 'b2',
// // //     name: 'Sara Khan',
// // //     phone: '+91 99870 11223',
// // //     email: 'sara@example.com',
// // //     photoUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2',
// // //     rating: 4.5,
// // //     dealsClosed: 96,
// // //   ),
// // //   Broker(
// // //     id: 'b3',
// // //     name: 'Vikram Patel',
// // //     phone: '+91 90000 11111',
// // //     email: 'vikram@example.com',
// // //     photoUrl: 'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c',
// // //     rating: 4.8,
// // //     dealsClosed: 162,
// // //   ),
// // //   Broker(
// // //     id: 'b4',
// // //     name: 'Neha Sharma',
// // //     phone: '+91 91234 56789',
// // //     email: 'neha@example.com',
// // //     photoUrl: 'https://images.unsplash.com/photo-1545996124-0501ebae84d0',
// // //     rating: 4.6,
// // //     dealsClosed: 120,
// // //   ),
// // //   Broker(
// // //     id: 'b5',
// // //     name: 'Rohan Gupta',
// // //     phone: '+91 98765 00000',
// // //     email: 'rohan@example.com',
// // //     photoUrl: 'https://images.unsplash.com/photo-1599566150163-29194dcaad36',
// // //     rating: 4.4,
// // //     dealsClosed: 88,
// // //   ),
// // // ];
// // //
// // // final mockProperties = <Property>[
// // //   Property(
// // //     id: 'p1',
// // //     title: 'Modern 3BHK Apartment',
// // //     address: '12 Palm Avenue',
// // //     city: 'Mumbai',
// // //     price: 24500000,
// // //     areaSqft: 1450,
// // //     beds: 3,
// // //     baths: 2,
// // //     imageUrl: 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85',
// // //     gallery: [
// // //       'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85',
// // //       'https://images.unsplash.com/photo-1505691938895-1758d7feb511',
// // //       'https://images.unsplash.com/photo-1515263487990-61b07816b324',
// // //     ],
// // //     broker: mockBrokers[0],
// // //   ),
// // //   Property(
// // //     id: 'p2',
// // //     title: 'Lakeview Villa',
// // //     address: '88 Serene Lane',
// // //     city: 'Bengaluru',
// // //     price: 56000000,
// // //     areaSqft: 3200,
// // //     beds: 4,
// // //     baths: 4,
// // //     imageUrl: 'https://images.unsplash.com/photo-1600585154526-990dced4db0d',
// // //     gallery: [
// // //       'https://images.unsplash.com/photo-1600585154526-990dced4db0d',
// // //       'https://images.unsplash.com/photo-1501183638710-841dd1904471',
// // //       'https://images.unsplash.com/photo-1493809842364-78817add7ffb',
// // //     ],
// // //     broker: mockBrokers[1],
// // //   ),
// // //   Property(
// // //     id: 'p3',
// // //     title: 'Cozy Studio Loft',
// // //     address: '5 Market Street',
// // //     city: 'Pune',
// // //     price: 8500000,
// // //     areaSqft: 520,
// // //     beds: 1,
// // //     baths: 1,
// // //     imageUrl: 'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267',
// // //     gallery: [
// // //       'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267',
// // //       'https://images.unsplash.com/photo-1536376072261-38c75010e6c9',
// // //     ],
// // //     broker: mockBrokers[0],
// // //   ),
// // //
// // //   // ... (keep others similar to previous list)
// // // ];
// // // =================================
// // // FILE: lib/data/mock_data.dart
// // // =================================
// // // =================================
// // // FILE: lib/data/mock_data.dart
// // // =================================
// //
// // import 'dart:math';
// // import '../models/broker.dart';
// // import '../models/property.dart';
// //
// // /// We use a seeded RNG so the mock data is stable across runs.
// // final _rng = Random(42);
// //
// // final _cities = <String>[
// //   'Mumbai', 'Bengaluru', 'Delhi', 'Hyderabad', 'Pune', 'Chennai',
// //   'Kolkata', 'Ahmedabad', 'Jaipur', 'Surat', 'Kochi', 'Lucknow',
// //   'Indore', 'Gurugram', 'Noida', 'Goa', 'Chandigarh', 'Nagpur',
// //   'Thane', 'Visakhapatnam'
// // ];
// //
// // final _streetNames = <String>[
// //   'Palm Avenue', 'Serene Lane', 'Market Street', 'Skyline Road',
// //   'Tech Park', 'Ocean Drive', 'Green Street', 'Fort Lane',
// //   'Willow Bend', 'Central Plaza', 'Sunset Blvd', 'Elm Street',
// //   'Lake Road', 'Garden View', 'Hill Crest', 'River Walk'
// // ];
// //
// // final _propertyTypes = <String>[
// //   'Studio', '1BHK', '2BHK', '3BHK', '4BHK', 'Penthouse',
// //   'Villa', 'Duplex', 'Bungalow', 'Loft', 'Condo', 'Townhouse'
// // ];
// //
// // final _unsplashHomes = <String>[
// //   'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85',
// //   'https://images.unsplash.com/photo-1600585154526-990dced4db0d',
// //   'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267',
// //   'https://images.unsplash.com/photo-1501183638710-841dd1904471',
// //   'https://images.unsplash.com/photo-1493809842364-78817add7ffb',
// //   'https://images.unsplash.com/photo-1536376072261-38c75010e6c9',
// //   'https://images.unsplash.com/photo-1505691938895-1758d7feb511',
// //   'https://images.unsplash.com/photo-1554995207-c18c203602cb',
// //   'https://images.unsplash.com/photo-1484154218962-a197022b5858',
// //   'https://images.unsplash.com/photo-1515263487990-61b07816b324',
// // ];
// //
// // final _unsplashPeople = <String>[
// //   'https://images.unsplash.com/photo-1607746882042-944635dfe10e',
// //   'https://images.unsplash.com/photo-1544005313-94ddf0286df2',
// //   'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c',
// //   'https://images.unsplash.com/photo-1545996124-0501ebae84d0',
// //   'https://images.unsplash.com/photo-1599566150163-29194dcaad36',
// //   'https://images.unsplash.com/photo-1541534401786-2077eed87a72',
// //   'https://images.unsplash.com/photo-1527980965255-d3b416303d12',
// //   'https://images.unsplash.com/photo-1524504388940-b1c1722653e1',
// //   'https://images.unsplash.com/photo-1524504388940-1e0a8f3d4c3b',
// //   'https://images.unsplash.com/photo-1547425260-1a1a1a1a1a1a'
// // ];
// //
// // String _pick(List<String> list) => list[_rng.nextInt(list.length)];
// //
// // String _phone() {
// //   // +91 9XXXX XXXXX
// //   final n1 = 90000 + _rng.nextInt(9999);
// //   final n2 = 10000 + _rng.nextInt(89999);
// //   return '+91 $n1 $n2';
// // }
// //
// // String _email(String name, int i) =>
// //     '${name.toLowerCase().replaceAll(' ', '')}$i@example.com';
// //
// // double _rating() => (4.2 + _rng.nextDouble() * 0.8); // 4.2 .. 5.0
// //
// // int _deals() => 40 + _rng.nextInt(160);
// //
// // String _address() => '${1 + _rng.nextInt(200)} ${_pick(_streetNames)}';
// //
// // // NEW: simple demo 4-digit PIN generator (1000..9999)
// // String _pin() => (1000 + _rng.nextInt(9000)).toString();
// //
// // int _bedsFor(String type) {
// //   switch (type) {
// //     case 'Studio':
// //       return 1;
// //     case '1BHK':
// //       return 1;
// //     case '2BHK':
// //       return 2;
// //     case '3BHK':
// //       return 3;
// //     case '4BHK':
// //     case 'Penthouse':
// //       return 4;
// //     case 'Villa':
// //     case 'Duplex':
// //     case 'Bungalow':
// //       return 4;
// //     case 'Loft':
// //       return 1 + _rng.nextInt(2);
// //     case 'Condo':
// //     case 'Townhouse':
// //       return 2 + _rng.nextInt(2);
// //     default:
// //       return 2;
// //   }
// // }
// //
// // int _bathsFor(int beds) => max(1, (beds / 1.5).round());
// //
// // int _areaFor(String type) {
// //   switch (type) {
// //     case 'Studio':
// //       return 450 + _rng.nextInt(250); // 450-700
// //     case '1BHK':
// //       return 600 + _rng.nextInt(300); // 600-900
// //     case '2BHK':
// //       return 900 + _rng.nextInt(400); // 900-1300
// //     case '3BHK':
// //       return 1300 + _rng.nextInt(600); // 1300-1900
// //     case '4BHK':
// //       return 1800 + _rng.nextInt(900); // 1800-2700
// //     case 'Penthouse':
// //       return 2800 + _rng.nextInt(1800); // 2800-4600
// //     case 'Villa':
// //       return 2400 + _rng.nextInt(2000); // 2400-4400
// //     case 'Duplex':
// //       return 1800 + _rng.nextInt(1400); // 1800-3200
// //     case 'Bungalow':
// //       return 2200 + _rng.nextInt(2200); // 2200-4400
// //     case 'Loft':
// //       return 700 + _rng.nextInt(400); // 700-1100
// //     case 'Condo':
// //       return 800 + _rng.nextInt(500); // 800-1300
// //     case 'Townhouse':
// //       return 1200 + _rng.nextInt(700); // 1200-1900
// //     default:
// //       return 1200 + _rng.nextInt(800);
// //   }
// // }
// //
// // double _priceFor(String city, String type, double areaSqft) {
// //   // crude city multiplier
// //   final cityFactor = {
// //     'Mumbai': 1.9,
// //     'Bengaluru': 1.6,
// //     'Delhi': 1.7,
// //     'Hyderabad': 1.3,
// //     'Pune': 1.25,
// //     'Chennai': 1.2,
// //     'Kolkata': 1.15,
// //     'Gurugram': 1.6,
// //     'Noida': 1.3,
// //     'Goa': 1.4,
// //   }[city] ?? 1.0;
// //
// //   final basePerSqft = {
// //     'Studio': 6500,
// //     '1BHK': 8000,
// //     '2BHK': 10000,
// //     '3BHK': 12000,
// //     '4BHK': 14000,
// //     'Penthouse': 18000,
// //     'Villa': 16000,
// //     'Duplex': 14000,
// //     'Bungalow': 17000,
// //     'Loft': 9000,
// //     'Condo': 11000,
// //     'Townhouse': 12000,
// //   }[type] ?? 11000;
// //
// //   // INR price; clamp to sensible min/max
// //   final p = areaSqft * basePerSqft * cityFactor;
// //   return p.clamp(35_00_000, 12_00_00_000).toDouble(); // 35L .. 12Cr (approx)
// // }
// //
// // /// ---- Brokers (25) ---------------------------------------------------------
// // final List<Broker> mockBrokers = List.generate(25, (i) {
// //   final firstNames = [
// //     'Aarav', 'Sara', 'Vikram', 'Neha', 'Rohan', 'Ishita', 'Karan', 'Meera',
// //     'Ananya', 'Kabir', 'Aisha', 'Rahul', 'Ritika', 'Aakash', 'Nisha',
// //     'Varun', 'Priya', 'Arjun', 'Divya', 'Sanjay', 'Juhi', 'Amar', 'Sneha',
// //     'Ravi', 'Kavya'
// //   ];
// //   final lastNames = [
// //     'Mehta', 'Khan', 'Patel', 'Sharma', 'Gupta', 'Iyer', 'Kapoor', 'Nair',
// //     'Reddy', 'Verma', 'Das', 'Bose', 'Malhotra', 'Trivedi', 'Bajaj',
// //     'Saxena', 'Bansal', 'Chawla', 'Menon', 'Kulkarni', 'Chauhan', 'Singh',
// //     'Roy', 'Sethi', 'Agarwal'
// //   ];
// //   final name = '${firstNames[i % firstNames.length]} ${lastNames[i % lastNames.length]}';
// //   return Broker(
// //     id: 'b${i + 1}',
// //     name: name,
// //     phone: _phone(),
// //     email: _email(name.replaceAll(RegExp(r'[^a-zA-Z ]'), ''), i + 1),
// //     photoUrl: _unsplashPeople[i % _unsplashPeople.length],
// //     rating: double.parse(_rating().toStringAsFixed(1)),
// //     dealsClosed: _deals(),
// //     pin: _pin(), // <-- NEW: 4-digit PIN per broker
// //   );
// // });
// //
// // /// ---- Properties (15 per broker -> 375) -----------------------------------
// // final List<Property> mockProperties = [
// //   for (int bi = 0; bi < mockBrokers.length; bi++)
// //     ...List.generate(15, (pi) {
// //       final broker = mockBrokers[bi];
// //       final type = _propertyTypes[_rng.nextInt(_propertyTypes.length)];
// //       final city = _cities[(bi + pi) % _cities.length];
// //       final beds = _bedsFor(type);
// //       final baths = _bathsFor(beds);
// //       final area = double.parse(_areaFor(type).toStringAsFixed(0));
// //       final image = _unsplashHomes[(bi + pi) % _unsplashHomes.length];
// //       final gallery = <String>[
// //         image,
// //         _unsplashHomes[(bi + pi + 1) % _unsplashHomes.length],
// //         _unsplashHomes[(bi + pi + 2) % _unsplashHomes.length],
// //       ];
// //       final price = _priceFor(city, type, area);
// //
// //       final id = 'p${bi + 1}_${pi + 1}';
// //       final title = _titleFor(type, beds);
// //
// //       return Property(
// //         id: id,
// //         title: title,
// //         address: _address(),
// //         city: city,
// //         price: price,
// //         areaSqft: area,
// //         beds: beds,
// //         baths: baths,
// //         imageUrl: image,
// //         gallery: gallery,
// //         broker: broker,
// //       );
// //     })
// // ];
// //
// // String _titleFor(String type, int beds) {
// //   switch (type) {
// //     case 'Studio':
// //       return 'Cozy Studio Loft';
// //     case '1BHK':
// //       return 'Smart ${type} City Pad';
// //     case '2BHK':
// //       return 'Modern ${type} Apartment';
// //     case '3BHK':
// //       return 'Spacious ${type} Home';
// //     case '4BHK':
// //       return 'Premium ${type} Residence';
// //     case 'Penthouse':
// //       return 'Penthouse with Terrace';
// //     case 'Villa':
// //       return 'Lakeview Villa';
// //     case 'Duplex':
// //       return 'Garden View Duplex';
// //     case 'Bungalow':
// //       return 'Beachside Bungalow';
// //     case 'Loft':
// //       return 'Stylish Loft';
// //     case 'Condo':
// //       return 'Urban Condo ${beds}BR';
// //     case 'Townhouse':
// //       return 'Family Townhouse';
// //     default:
// //       return 'Property ${beds}BR';
// //   }
// // }
// // =================================
// // FILE: lib/models/mock_data.dart
// // Minimal dataset: 2 brokers, 5 properties
// // =================================
// import 'broker.dart';
// import 'property.dart';
//
// const mockBrokers = <Broker>[
//   Broker(
//     id: 'b1',
//     name: 'Aarav Mehta',
//     phone: '+91 98765 43210',
//     email: 'aarav@example.com',
//     photoUrl: 'https://images.unsplash.com/photo-1607746882042-944635dfe10e',
//     rating: 4.7,
//     dealsClosed: 134,
//   ),
//   Broker(
//     id: 'b2',
//     name: 'Sara Khan',
//     phone: '+91 99870 11223',
//     email: 'sara@example.com',
//     photoUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2',
//     rating: 4.5,
//     dealsClosed: 96,
//   ),
// ];
//
// final mockProperties = <Property>[
//   Property(
//     id: 'p1',
//     title: 'Modern 3BHK Apartment',
//     address: '12 Palm Avenue',
//     city: 'Mumbai',
//     price: 24500000,
//     areaSqft: 1450,
//     beds: 3,
//     baths: 2,
//     imageUrl: 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85',
//     gallery: [
//       'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85',
//       'https://images.unsplash.com/photo-1505691938895-1758d7feb511',
//       'https://images.unsplash.com/photo-1515263487990-61b07816b324',
//     ],
//     broker: mockBrokers[0],
//   ),
//   Property(
//     id: 'p2',
//     title: 'Lakeview Villa',
//     address: '88 Serene Lane',
//     city: 'Bengaluru',
//     price: 56000000,
//     areaSqft: 3200,
//     beds: 4,
//     baths: 4,
//     imageUrl: 'https://images.unsplash.com/photo-1600585154526-990dced4db0d',
//     gallery: [
//       'https://images.unsplash.com/photo-1600585154526-990dced4db0d',
//       'https://images.unsplash.com/photo-1501183638710-841dd1904471',
//       'https://images.unsplash.com/photo-1493809842364-78817add7ffb',
//     ],
//     broker: mockBrokers[1],
//   ),
//   Property(
//     id: 'p3',
//     title: 'Cozy Studio Loft',
//     address: '5 Market Street',
//     city: 'Pune',
//     price: 8500000,
//     areaSqft: 520,
//     beds: 1,
//     baths: 1,
//     imageUrl: 'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267',
//     gallery: [
//       'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267',
//       'https://images.unsplash.com/photo-1536376072261-38c75010e6c9',
//     ],
//     broker: mockBrokers[0],
//   ),
//   Property(
//     id: 'p4',
//     title: 'Family Townhouse',
//     address: '21 Garden View',
//     city: 'Hyderabad',
//     price: 17800000,
//     areaSqft: 1650,
//     beds: 3,
//     baths: 3,
//     imageUrl: 'https://images.unsplash.com/photo-1554995207-c18c203602cb',
//     gallery: [
//       'https://images.unsplash.com/photo-1554995207-c18c203602cb',
//       'https://images.unsplash.com/photo-1484154218962-a197022b5858',
//     ],
//     broker: mockBrokers[1],
//   ),
//   Property(
//     id: 'p5',
//     title: 'Penthouse with Terrace',
//     address: '9 Skyline Road',
//     city: 'Delhi',
//     price: 89000000,
//     areaSqft: 4100,
//     beds: 4,
//     baths: 5,
//     imageUrl: 'https://images.unsplash.com/photo-1501183638710-841dd1904471',
//     gallery: [
//       'https://images.unsplash.com/photo-1501183638710-841dd1904471',
//       'https://images.unsplash.com/photo-1493809842364-78817add7ffb',
//       'https://images.unsplash.com/photo-1515263487990-61b07816b324',
//     ],
//     broker: mockBrokers[0],
//   ),
// ];
import 'broker.dart';
import 'property.dart';

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
    rating: 4.6,
    dealsClosed: 102,
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
    gallery: [
      'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85',
      'https://images.unsplash.com/photo-1505691938895-1758d7feb511',
    ],
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
    gallery: [
      'https://images.unsplash.com/photo-1600585154526-990dced4db0d',
      'https://images.unsplash.com/photo-1501183638710-841dd1904471',
    ],
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
    gallery: [
      'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267',
      'https://images.unsplash.com/photo-1536376072261-38c75010e6c9',
    ],
    broker: mockBrokers[0],
  ),
  Property(
    id: 'p4',
    title: 'Premium 4BHK Residence',
    address: '21 Skyline Road',
    city: 'Delhi',
    price: 37500000,
    areaSqft: 2100,
    beds: 4,
    baths: 3,
    imageUrl: 'https://images.unsplash.com/photo-1554995207-c18c203602cb',
    gallery: [
      'https://images.unsplash.com/photo-1554995207-c18c203602cb',
      'https://images.unsplash.com/photo-1484154218962-a197022b5858',
    ],
    broker: mockBrokers[1],
  ),
  Property(
    id: 'p5',
    title: 'Smart 2BHK City Pad',
    address: '77 Garden View',
    city: 'Chennai',
    price: 12500000,
    areaSqft: 980,
    beds: 2,
    baths: 2,
    imageUrl: 'https://images.unsplash.com/photo-1515263487990-61b07816b324',
    gallery: [
      'https://images.unsplash.com/photo-1515263487990-61b07816b324',
      'https://images.unsplash.com/photo-1493809842364-78817add7ffb',
    ],
    broker: mockBrokers[0],
  ),
];
