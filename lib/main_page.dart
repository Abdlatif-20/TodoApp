// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:todo_app/todo_card.dart';

import 'counter.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class Task {
  String taskName;
  bool taskStatus;
  Task({required this.taskName, required this.taskStatus});
}

class _TodoAppState extends State<TodoApp> {
  final newTask = TextEditingController();

  List allTask = [];
  int numberTasks = 0;
  int tasksIsDone = 0;


  int checkTaskIsDone() {
    int calculateCompletedTask = 0;
    for (var element in allTask) {
      if (element.taskStatus) {
        calculateCompletedTask++;
      }
    }
    return (calculateCompletedTask);
  }

  addNewTask() {
    setState(() {
      newTask.text.isEmpty
          ? allTask.isEmpty
          : allTask.add(Task(taskName: newTask.text, taskStatus: false));

      allTask.isEmpty ? numberTasks : numberTasks++;
    });
  }

  changeStatus(int taskIndex) {
    setState(() {
      allTask[taskIndex].taskStatus = !allTask[taskIndex].taskStatus;
    });
  }

deletTask(int taskIndex)
{
  setState(() {
    allTask.removeAt(taskIndex);
  });
}

deletAllTask()
{
  setState(() {
    allTask.clear();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  height: 150,
                  margin: EdgeInsets.only(left: 10),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: newTask,
                        maxLength: 20,
                        decoration: InputDecoration(
                          hintText: "Add Your Task",
                          prefix: Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Icon(
                                Icons.task,
                                color: Colors.red,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextButton(
                          onPressed: () {
                            addNewTask();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Add Task",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 34,
        ),
        backgroundColor: Colors.redAccent,
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              deletAllTask();
            },
            icon: Icon(Icons.delete_forever, color: Colors.white,),
          )
        ],
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        title: Text(
          "TODO APP",
          style: TextStyle(
            color: Colors.grey[200],
            fontSize: 34,
          ),
        ),
      ),
      body: Container(
        color: Color.fromRGBO(58, 66, 86, 0.7),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            TaskCounter(
              taskCompleted: checkTaskIsDone(),
              taskNumber: allTask.length,
            ),
            Expanded(
              child: SizedBox(
                height: 650,
                child: ListView.builder(
                    itemCount: allTask.length,
                    itemBuilder: (BuildContext context, index) {
                      return TodoCard(
                        titel: allTask[index].taskName,
                        doneOrot: allTask[index].taskStatus,
                        myfunc: changeStatus,
                        taskindex: index,
                        deletTask: deletTask,
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
