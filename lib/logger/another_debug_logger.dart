import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_singleton/logger/base_logger.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class AnotherDebugLogger extends BaseLogger {
  static AnotherDebugLogger? _instance;
  late final Logger _logger;

  AnotherDebugLogger._internal() {
    dateFormatter = DateFormat('HH:mm:ss.S');
    _logger = Logger();
    debugPrint('<AnotherDebugLogger> creation');
    _instance = this;
  }

  factory AnotherDebugLogger() => _instance ?? AnotherDebugLogger._internal();

  @override
  void log(message, [Object? error, StackTrace? stackTrace]) =>
      _logger.i(message, error, stackTrace);
}
