import 'package:dzien_dobry/consts/paddings.dart';
import 'package:flutter/material.dart';

class ToDoPanel extends StatelessWidget {
  final List<String> toDos;
  const ToDoPanel({super.key, required this.toDos});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyPaddings.onlyTop,
      child: SizedBox(
        height: 100,
        child: Column(
          children: [
            const Text('Wymagane działania:'),
            Flexible(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: toDos.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(toDos[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
