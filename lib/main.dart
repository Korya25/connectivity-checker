import 'package:flutter/material.dart';

import 'package:test/core/network/connectivity_controller.dart';
import 'package:test/presentation/app/store_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConnectivityController.instance.init();
  runApp(const StoreApp());
}
