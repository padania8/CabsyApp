# widgets — Reusable UI Components

Shared Flutter widgets used across multiple screens.

## Components

| File | Description |
|------|-------------|
| `feature_card.dart` | Card widget displaying a service or feature |

## Usage

Import widgets from within the app:

```dart
import 'package:cabsy_app/widgets/feature_card.dart';

// In a screen's build method:
FeatureCard(
  title: 'Quick Booking',
  icon: Icons.directions_car,
  onTap: () => Navigator.pushNamed(context, '/booking'),
)
```

## Widget Design Principles

- **Stateless by preference**: Use `StatelessWidget` unless local state is needed
- **Configurable**: Accept parameters for flexibility
- **Themed**: Use `Theme.of(context)` for colors and typography
- **Accessible**: Include `semanticLabel` where appropriate
- **Tested**: Each widget should have a corresponding test

## Example Widget Pattern

```dart
class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon),
            Text(title),
          ],
        ),
      ),
    );
  }
}
```

## Adding a New Widget

1. Create `widgets/my_widget.dart`
2. Use `StatelessWidget` or `StatefulWidget`
3. Export it in `widgets/` if needed
4. Add a test in `test/`
5. Import in screens as needed
