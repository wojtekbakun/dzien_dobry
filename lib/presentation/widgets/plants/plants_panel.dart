import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/consts/shapes.dart';
import 'package:flutter/material.dart';

class PlantsPanel extends StatelessWidget {
  const PlantsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyPaddings.onlyTop,
      child: Column(
        children: [
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Twoje rośliny',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    'Wszystkie są zadowolone!',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              const Expanded(
                child: Row(),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: MyRadius.medium,
                  color: Theme.of(context).cardColor,
                ),
                child: Padding(
                  padding: MyPaddings.smallAll,
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
