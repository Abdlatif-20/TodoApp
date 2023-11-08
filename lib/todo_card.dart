// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String titel;
  final bool doneOrot;
  final int taskindex;
  final Function myfunc;
  final Function deletTask;
  const TodoCard({
    super.key,
    required this.titel,
    required this.doneOrot,
    required this.myfunc,
    required this.taskindex,
    required this.deletTask,
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
                  decoration: doneOrot? TextDecoration.lineThrough:TextDecoration.none,
                ),
              ),
              Row(
                children: [
                  Icon(
                    doneOrot ? Icons.check : Icons.close,
                    color: doneOrot ? Colors.green : Colors.redAccent,
                    size: 40,
                  ),
                  IconButton(
                    onPressed: () {
                      deletTask(taskindex);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 27,
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
