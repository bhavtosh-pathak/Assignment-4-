import 'package:flutter/material.dart';

class Task {
  String name;
  bool isCompleted;

  Task({required this.name, this.isCompleted = false});
}

class TaskListWidget extends StatefulWidget {
  const TaskListWidget({super.key});

  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  final List<Task> _tasks = [
    Task(name: 'Buy groceries'),
    Task(name: 'Finish report'),
    Task(name: 'Call mom'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Task List',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        const Text(
          'Mark tasks as completed by checking the boxes.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 16.0),
        ListView.builder(
          shrinkWrap: true, // Important for nested list views
          physics: const NeverScrollableScrollPhysics(), // Disable scrolling for this list
          itemCount: _tasks.length,
          itemBuilder: (context, index) {
            final task = _tasks[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      task.name,
                      style: TextStyle(
                        fontSize: 18,
                        decoration: task.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        color: task.isCompleted ? Colors.grey : Colors.white,
                      ),
                    ),
                  ),
                  Checkbox(
                    value: task.isCompleted,
                    onChanged: (bool? newValue) {
                      setState(() {
                        task.isCompleted = newValue ?? false;
                      });
                    },
                    activeColor: Colors.green, // Green checkbox
                    checkColor: Colors.black, // Color of the checkmark
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
