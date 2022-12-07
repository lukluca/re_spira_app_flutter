
import 'package:flutter/services.dart';

/// blocks rotation; sets orientation to: landscape
void landscapeModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}
