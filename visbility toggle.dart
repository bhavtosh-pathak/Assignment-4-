import 'package:flutter/material.dart';

class VisibilityToggleWidget extends StatelessWidget {
  final ValueNotifier<bool> showWidget;
  final Widget childToShow;

  const VisibilityToggleWidget({
    super.key,
    required this.showWidget,
    required this.childToShow,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Toggle Visibility',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        const Text(
          'Toggle the visibility of the widget below.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'Show Widget',
              style: TextStyle(fontSize: 18),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: showWidget,
              builder: (context, isVisible, child) {
                return Switch(
                  value: isVisible,
                  onChanged: (newValue) {
                    showWidget.value = newValue; // Toggle visibility
                  },
                  activeColor: const Color.fromARGB(255, 255, 255, 255), // Green switch color
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        ValueListenableBuilder<bool>(
          valueListenable: showWidget,
          builder: (context, isVisible, child) {
            return AnimatedOpacity(
              opacity: isVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: isVisible ? childToShow : const SizedBox.shrink(),
            );
          },
        ),
      ],
    );
  }
}
