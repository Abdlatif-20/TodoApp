// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TaskCounter extends StatelessWidget {
  final int taskCompleted;
  final int taskNumber;
  const TaskCounter(
      {super.key, required this.taskCompleted, required this.taskNumber});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 22),
      child: Text(
        "$taskCompleted/$taskNumber",
        style: TextStyle(
          fontSize: 40,
          color: taskCompleted > 0 && taskCompleted == taskNumber
              ? Colors.greenAccent[200]
              : Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
