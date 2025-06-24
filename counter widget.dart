import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final ValueNotifier<int> counter;

  const CounterWidget({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Counter',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        const Text(
          'Tap the button to increment the counter.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 16.0),
        ValueListenableBuilder<int>(
          valueListenable: counter,
          builder: (context, count, child) {
            return Text(
              'Count: $count',
              style: const TextStyle(fontSize: 18),
            );
          },
        ),
        const SizedBox(height: 16.0),
        Center(
          child: Container(
            child: ElevatedButton(
              onPressed: () {
                counter.value++; // Increment the counter
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 166, 217, 211), // Green button color
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0), // Rounded corners
                ),
              ),
              child: const Text(
                'Increment',
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
