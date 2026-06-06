import 'dart:async';
import 'package:flutter/foundation.dart';

class Debounce {
  Timer? _timer;

  void run(VoidCallback action, int milliseconds) {
    _timer?.cancel();

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
