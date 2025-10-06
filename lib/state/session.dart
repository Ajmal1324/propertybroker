// // lib/state/session.dart
// import 'package:flutter/foundation.dart';
// import '../models/broker.dart';
//
// enum AppRole { guest, admin, broker }
//
// class Session extends ChangeNotifier {
//   AppRole role = AppRole.guest;
//   Broker? currentBroker;
//
//   bool get isAdmin => role == AppRole.admin;
//   bool get isBroker => role == AppRole.broker && currentBroker != null;
//
//   void setAdmin() {
//     role = AppRole.admin;
//     currentBroker = null;
//     notifyListeners();
//   }
//
//   bool loginBroker(Broker broker, String pin) {
//     if (broker.pin == pin) {
//       role = AppRole.broker;
//       currentBroker = broker;
//       notifyListeners();
//       return true;
//     }
//     return false;
//   }
//
//   void logout() {
//     role = AppRole.guest;
//     currentBroker = null;
//     notifyListeners();
//   }
// }
import 'package:flutter/foundation.dart';
import '../models/broker.dart';

enum AppRole { guest, broker, admin }

class Session extends ChangeNotifier {
  AppRole role = AppRole.guest;
  Broker? currentBroker;

  bool get isGuest => role == AppRole.guest;
  bool get isBroker => role == AppRole.broker && currentBroker != null;
  bool get isAdmin  => role == AppRole.admin;

  void setAdmin() {
    role = AppRole.admin;
    currentBroker = null;
    notifyListeners();
  }

  // No PIN flow: pick broker -> login
  bool loginBroker(Broker broker) {
    currentBroker = broker;
    role = AppRole.broker;
    notifyListeners();
    return true;
  }

  void logout() {
    role = AppRole.guest;
    currentBroker = null;
    notifyListeners();
  }
}
