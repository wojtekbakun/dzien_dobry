import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/presentation/widgets/plants/to_do_card.dart';
import 'package:flutter/material.dart';

class ToDoPanel extends StatelessWidget {
  final List<dynamic> toDos;
  const ToDoPanel({super.key, required this.toDos});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyPaddings.onlyTop,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: MyPaddings.symmetricHorizontal,
            child: Text(
              'Wymagane działania:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 64,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: toDos.length,
              itemBuilder: (context, index) {
                return ToDoCard(
                  toDo: toDos[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
