import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

class HomePage {

  final counterTextFinder = find.byValueKey('counterText');
  final buttonFinder = find.byTooltip('increment');
  final buttonAdd = find.byValueKey("add");
  final buttonSubtract = find.byValueKey("subtract");
  final alertText = find.byValueKey("alert_text");
  final btnClose = find.byValueKey("close_button");

  FlutterDriver _driver;

  HomePage(FlutterDriver driver){this._driver = driver;}

  Future<String> getCounterValue() async {
    return await _driver.getText(counterTextFinder);
  }

  Future<HomePage> tapOnButton() async {
    await _driver.tap(buttonFinder);
    return this;
  }

  Future<HomePage> tapOnAddButton() async {
    await _driver.tap(buttonAdd);
    return this;
  }

  Future<void> increaseCounter(int counter) async {
    for (int i = 0; i < counter; i++) {
      await _driver.tap(buttonFinder);
    }
  }
  Future<void> assertThatCounterIsIncreasedProperly(String expectedCounter) async {
    expect(await _driver.getText(counterTextFinder), expectedCounter);
    }

  Future<void> assertThatInformationOnAlertIsCorrect (String expectedCounter) async {
    expect(await _driver.getText(alertText), "Welcome to ExecuteAutomation " + expectedCounter);
  }

  }


