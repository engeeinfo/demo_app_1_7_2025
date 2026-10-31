# Demo App

Flutter application containing welcome, login, home, profile, settings, and
calculator flows.

## Requirements

- Flutter SDK compatible with Dart `^3.8.1`
- Android, iOS, or desktop toolchain for platform builds

## Setup and verification

```sh
flutter pub get
flutter analyze
flutter test
flutter build apk --debug
```

Integration tests live in `integration_testing/` and are run with a configured
device or integration-test runner.

## Structure

- `lib/main.dart` composes the application.
- `lib/data/` contains shared constants, notifiers, and calculator logic.
- `test/` contains widget and unit tests.
- `integration_testing/` contains end-to-end page flows.
- `asset/` contains images and Lottie animations.
- `docs/ARCHITECTURE.md` describes the application layers.
- `docs/MODERNIZATION.md` records the baseline and audit.

## Contributing

Keep reusable state and data logic out of page widgets, add a regression test
for behavior changes, and run analyze plus the relevant unit/widget tests
before submitting a change.
