import 'package:flutter/foundation.dart';

String propertyUrl(String propertyId) {
  if (kIsWeb) {
    // Uses current origin when running on any domain
    return Uri.base.replace(path: '/p/$propertyId', query: '').toString();
  }
  // Fallback: your production Hosting domain
  return 'https://propertybroker-test.web.app/p/$propertyId';
}

String brokerUrl(String brokerId) {
  if (kIsWeb) {
    return Uri.base.replace(path: '/b/$brokerId', query: '').toString();
  }
  return 'https://propertybroker-test.web.app/b/$brokerId';
}
