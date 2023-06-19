import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_singleton/logger/debug_logger.dart';
import 'package:path_provider/path_provider.dart';

class FileAuditManager {
  static final FileAuditManager _instance = FileAuditManager._internal();
  static const String fileName = 'audit.txt';

  FileAuditManager._internal() {
    debugPrint('<FileAuditManager> creation.');
  }

  factory FileAuditManager() => _instance;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    final logger = DebugLogger();
    logger.log('FileAuditManager file path: $path/$fileName');
    return File('$path/$fileName');
  }

  Future<File> auditAction(String message) async {
    final file = await _localFile;

    String formattedMessage = '${DateTime.now()} - $message\n';

    return file.writeAsString(formattedMessage, mode: FileMode.writeOnlyAppend);
  }
}
