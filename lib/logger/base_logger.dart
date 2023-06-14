import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

abstract class BaseLogger {
  @protected
  late final DateFormat dateFormatter;

  void log(message, [Object? error, StackTrace? stackTrace]);
}
