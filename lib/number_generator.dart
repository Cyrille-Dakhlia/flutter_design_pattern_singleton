import 'package:flutter/material.dart';

class NumberGenerator {
  static NumberGenerator? _instance;
  static int _number = 0;

  NumberGenerator._internal() {
    debugPrint('<NumberGenerator> creation.');
    _instance = this;
  }

  // Lazy instantiation
  factory NumberGenerator() => _instance ?? NumberGenerator._internal();

  int get currentNumber => _number;

  int getNextNumber() {
    return ++_number;
  }
}
