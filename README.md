# Roll the Dice

A simple Flutter app that shows a random dice side (1–6) each time you press **Roll Dice**.

- Dice images are local assets in `assets/images/` (`dice-1.png` … `dice-6.png`), registered in `pubspec.yaml`.
- `DiceRoller` is a `StatefulWidget`; pressing the button calls `setState()` with a new roll.
- The roll comes from `Random().nextInt(6) + 1` (`dart:math`).

## Run

```sh
flutter pub get
flutter run
```

## Test

```sh
flutter test
```
