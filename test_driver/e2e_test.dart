import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:ozzie/ozzie.dart';
import 'pages/home_page.dart';
import 'utils/actions.dart';


void main() {
  group('Counter', () {

    final counterTextFinder = find.byValueKey('counterText');

    FlutterDriver driver;
    Ozzie ozzie;


    setUpAll(() async {
      driver = await FlutterDriver.connect();
      ozzie = Ozzie.initWith(driver, groupName:'counter');
    });


    tearDownAll(() async {
      if (driver != null) {
        driver.close();
        ozzie.generateHtmlReport();
      }
    });

    test('starts at 0', () async {
      expect(await driver.getText(counterTextFinder), "0");
      await Actions.takeScreenshot(driver, 'screenshots/entered_text.png');
    });

    test('increments the counter', () async {

      await new HomePage(driver).increaseCounter(10);
      await new HomePage(driver).assertThatCounterIsIncreasedProperly("10");
    });

    test('bla bla', () async {
      await new HomePage(driver).tapOnAddButton();
      await new HomePage(driver).assertThatInformationOnAlertIsCorrect("10");
      await Actions.takeScreenshot(driver, 'screenshots/en.png');
    });

  });
}