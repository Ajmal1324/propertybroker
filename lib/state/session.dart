// lib/state/session.dart
import 'package:flutter/foundation.dart';
import '../models/broker.dart';

enum AppRole { guest, admin, broker }

class Session extends ChangeNotifier {
  AppRole role = AppRole.guest;
  Broker? currentBroker;

  bool get isAdmin => role == AppRole.admin;
  bool get isBroker => role == AppRole.broker && currentBroker != null;

  void setAdmin() {
    role = AppRole.admin;
    currentBroker = null;
    notifyListeners();
  }

  bool loginBroker(Broker broker, String pin) {
    if (broker.pin == pin) {
      role = AppRole.broker;
      currentBroker = broker;
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    role = AppRole.guest;
    currentBroker = null;
    notifyListeners();
  }
}
