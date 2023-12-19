import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list/components/item_list.dart';
import 'package:task_list/pages/task_add_screen.dart';
import 'package:task_list/providers/task_provider.dart';
import 'package:task_list/pages/task_edit_screen.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("task list"),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, _) {
          return taskProvider.listTask.isNotEmpty
              ? ListView.builder(
                  itemCount: taskProvider.listTask.length,
                  itemBuilder: (context, int index) {
                    return ItemList(
                      text: taskProvider.listTask[index],
                      onRemove: () {
                        taskProvider.removeTask(index);
                      },
                      onEdit: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TaskListEditScreen(index: index),
                          ),
                        );
                      },
                    );
                  },
                )
              : const Center(
                  child: Text(
                  "Lista Vazia!",
                  style: TextStyle(color: Colors.white),
                ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskListAddScreen(),
            ),
          );
        },
      ),
    );
  }
}
