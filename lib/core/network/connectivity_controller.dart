import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../utils/app_logger.dart';

class ConnectivityController {
  ConnectivityController._();

  static final ConnectivityController instance = ConnectivityController._();

  final ValueNotifier<bool> isConnected = ValueNotifier(false);

  bool _isFirstCheck = true;
  bool hasInitialized = false;

  Future<void> init() async {
    AppLogger.info(
      '📡 [ConnectivityController] Starting connectivity initialization...',
    );

    final List<ConnectivityResult> results = await Connectivity()
        .checkConnectivity();
    final ConnectivityResult firstResult = results.isNotEmpty
        ? results.first
        : ConnectivityResult.none;

    AppLogger.info('🔍 Initial Connectivity Check: $firstResult');

    await _verifyInternet(firstResult);
    hasInitialized = true;

    Connectivity().onConnectivityChanged.listen((results) {
      final ConnectivityResult result = results.isNotEmpty
          ? results.first
          : ConnectivityResult.none;

      AppLogger.warn('🔄 Connectivity Changed: $result');
      _verifyInternet(result);
    });
  }

  Future<void> _verifyInternet(ConnectivityResult result) async {
    AppLogger.info('🌐 Verifying internet access for: $result...');

    final checker = InternetConnectionChecker.createInstance();
    final hasInternet = await checker.hasConnection;

    if (_isFirstCheck) {
      _isFirstCheck = false;
      isConnected.value = hasInternet;
      return;
    }

    if (isConnected.value != hasInternet) {
      isConnected.value = hasInternet;
    }
  }
}
