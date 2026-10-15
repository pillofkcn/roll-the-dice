import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:roll_the_dice/main.dart';

String currentDiceImage(WidgetTester tester) {
  final image = tester.widget<Image>(find.byType(Image));
  return (image.image as AssetImage).assetName;
}

void main() {
  testWidgets('Rolling always shows a dice side from 1 to 6',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: GradientContainer())),
    );

    final validImages = {
      for (var side = 1; side <= 6; side++) 'assets/images/dice-$side.png',
    };
    expect(currentDiceImage(tester), 'assets/images/dice-1.png');

    final seenImages = <String>{};
    for (var roll = 0; roll < 100; roll++) {
      await tester.tap(find.text('Roll Dice'));
      await tester.pump();
      seenImages.add(currentDiceImage(tester));
    }

    expect(validImages.containsAll(seenImages), isTrue);
    // 100 rolls should hit more than one side.
    expect(seenImages.length, greaterThan(1));
  });
}
