// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String titel;
  final List allTask;
  final bool doneOrot;
  final int taskindex;
  final Function myfunc;
  final Function deletTask;
  final Function editTask;
  const TodoCard({
    super.key,
    required this.titel,
    required this.doneOrot,
    required this.myfunc,
    required this.taskindex,
    required this.deletTask,
    required this.editTask,
    required this.allTask,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myfunc(taskindex);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 15, bottom: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[900],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titel,
                style: TextStyle(
                  fontSize: 30,
                  color: doneOrot
                      ? Color.fromARGB(115, 180, 176, 176)
                      : Colors.white,
                  decoration: doneOrot
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              Row(
                children: [
                  Icon(
                    doneOrot ? Icons.check : Icons.close,
                    color: doneOrot ? Colors.green : Colors.redAccent,
                    size: 30,
                  ),
                  IconButton(
                    onPressed: () {
                      deletTask(taskindex);
                    },
                    tooltip: "delete task",
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Show a dialog or input field to edit the task
                      // Once edited, call the editTask function to update the list
                      showDialog(
                        context: context,
                        builder: (context) {
                          TextEditingController controller =
                              TextEditingController();
                          controller.text =
                              allTask[taskindex].taskName; // Use taskName
                          return AlertDialog(
                            title: Text('Edit Task'),
                            content: TextField(
                              controller: controller,
                            ),
                            actions: [
                              TextButton(
                                child: Text('Save'),
                                onPressed: () {
                                  editTask(taskindex, controller.text);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    tooltip: "edit task",
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 22,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
