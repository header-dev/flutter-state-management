import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/models/task_data.dart';
import 'package:to_do_app/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {

            final task = taskData.tasks[index];

            return TaskTile(
                isChecked: task.isDone,
                taskTitle: task.name,
                checkboxCallback: (checkboxState) {
                  taskData.updateTask(task);
                },
                longPressCallback: () {
                  taskData.deleteTask(task);
                }
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
