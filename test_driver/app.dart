import 'package:flutter/cupertino.dart';
import 'package:test_dev/main.dart' as app;
import 'package:flutter_driver/driver_extension.dart';

void main() {
  enableFlutterDriverExtension();
  runApp(app.App());
}