import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';

class Actions {

  static takeScreenshot(FlutterDriver driver, String path) async {
    final List<int> pixels = await driver.screenshot();
    final File file = new File(path);
    await file.writeAsBytes(pixels);
    print(path);
  }
}