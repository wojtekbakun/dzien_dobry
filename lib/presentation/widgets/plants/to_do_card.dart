import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/consts/shapes.dart';
import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  final String toDo;
  const ToDoCard({super.key, required this.toDo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyPaddings.weatherDotsHorizontal,
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: MyRadius.medium,
          ),
          child: Padding(
            padding: MyPaddings.mediumAll,
            child: Text(
              toDo,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          )),
    );
  }
}
