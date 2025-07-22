
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

enum NetworkStatusType { connected, disconnected }

class NetworkBanner {
  static Flushbar<dynamic>? _currentFlushbar;

  static void show(BuildContext context, NetworkStatusType status) {
    _currentFlushbar?.dismiss();

    _currentFlushbar = Flushbar(
      message: status == NetworkStatusType.connected
          ? '✅ Connected to the Internet'
          : '❌ No Internet Connection',
      icon: Icon(
        status == NetworkStatusType.connected ? Icons.wifi : Icons.wifi_off,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: status == NetworkStatusType.connected ? Colors.green : Colors.red,
      margin: const EdgeInsets.all(12),
      borderRadius: BorderRadius.circular(8),
      flushbarPosition: FlushbarPosition.TOP,
    )..show(context);
  }
}
