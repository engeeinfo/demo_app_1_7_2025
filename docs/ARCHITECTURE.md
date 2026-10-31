# Architecture

```text
platform runner
      ↓
lib/main.dart and page widgets
      ↓
lib/data/notifiers.dart and lib/data/constant.dart
      ↓
services and packages
```

- `main.dart` owns application composition and navigation.
- Page widgets render user flows and delegate reusable state to data notifiers.
- `lib/data/` owns shared values and calculator/domain behavior.
- Flutter plugins provide persistence, HTTP, animation, and platform services.

Page widgets should not reach directly into platform runners. New reusable
behavior belongs in `lib/data/` or a dedicated service with tests that do not
require a device where practical.
