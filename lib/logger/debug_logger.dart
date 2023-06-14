import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_singleton/logger/base_logger.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:logging/logging.dart';

class DebugLogger extends BaseLogger {
  static DebugLogger? _instance;
  late final Logger _logger;
  static const String appName = 'singleton_logger';

  DebugLogger._internal() {
    dateFormatter = DateFormat('HH:mm:ss.S');

    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen(_recordHandler);
    _logger = Logger('singleton_logger');

    debugPrint('<DebugLogger> creation');

    _instance = this;
  }

  // Lazy instantiation
  factory DebugLogger() => _instance ?? DebugLogger._internal();

  void _recordHandler(LogRecord event) => debugPrint(
      '${dateFormatter.format(event.time)}: ${event.message} - ${event.error}');

  @override
  void log(message, [Object? error, StackTrace? stackTrace]) =>
      _logger.info(message, error, stackTrace);
}
