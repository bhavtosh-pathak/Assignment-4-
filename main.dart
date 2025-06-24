import 'package:flutter/material.dart';
import 'package:assignment_4/counter_widget.dart';
import 'package:assignment_4/visibility_toggle_widget.dart';
import 'package:assignment_4/task_list_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Interactive Demo',
      theme: ThemeData(
        brightness: Brightness.dark, // Dark theme as per the image
        primarySwatch: Colors.blue,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ValueNotifiers for demonstrating state management
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<bool> _showWidget = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _counter.dispose();
    _showWidget.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Demo'),
        centerTitle: false, // Aligns title to the left as in the image
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Counter Section
            CounterWidget(counter: _counter),
            const SizedBox(height: 32.0),

            // Toggle Visibility Section
            VisibilityToggleWidget(
              showWidget: _showWidget,
              childToShow: Container(
                // This is the placeholder for the "White Textured Wall Art" image
                // In a real app, you'd load an actual image here.
                // For this demo, I'll use a colored container with text.
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey[700]!, width: 2),
                ),
                child: Center(
                  child: Text(
                    'White Textured Wall Art',
                    style: TextStyle(color: Colors.grey[400], fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32.0),

            // Task List Section
            const TaskListWidget(),
          ],
        ),
      ),
    );
  }
}
