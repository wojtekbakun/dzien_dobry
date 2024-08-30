import 'package:flutter/material.dart';

class PlantsPanel extends StatelessWidget {
  const PlantsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
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
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
