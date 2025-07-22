
// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  static void info(String message) {
    if (kDebugMode) _logger.i(message);
  }

  static void warn(String message) {
    if (kDebugMode) _logger.w(message);
  }

  static void error(String message) {
    if (kDebugMode) _logger.e(message);
  }

  static void debug(String message) {
    if (kDebugMode) _logger.d(message);
  }
}
