import 'dart:async';
import 'package:flutter/material.dart';

import 'firestore/database_service.dart';

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }
  Future<void> init() async {
    var _reference = await DatabaseService();
  }
}
