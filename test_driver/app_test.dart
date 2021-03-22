import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group( 'Test_Dev', () {
    final question = find.text('Questions Appear Here');
    final button = find.byType('Option');

    FlutterDriver driver;
    
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('question initiates with questions appear here', () async {
      await driver.runUnsynchronized(() async {
        expect(await driver.getText(question), "Questions Appear Here");
      });
    });

    test('Tests if points change on correct answer', () async {
      await driver.runUnsynchronized(() async {
        print('start');
      final oldQuestion = await driver.getText(question);
      print('got question');
      await driver.tap(button);
      print('tapped button');
      final counter = find.text('Answer Questions to Earn Points \n Current Points: 1');
      
      expect(await driver.getText(counter), 'Answer Questions to Earn Points \n Current Points: 1');
      });
      
    });
  });
}