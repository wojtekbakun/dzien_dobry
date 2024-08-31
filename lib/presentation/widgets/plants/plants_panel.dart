import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/consts/shapes.dart';
import 'package:dzien_dobry/presentation/widgets/plants/single_plant_container.dart';
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
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: MyRadius.small,
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(
                    Theme.of(context).cardColor,
                  ),
                ),
                child: const Padding(
                  padding: MyPaddings.smallAll,
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
          Padding(
            padding: MyPaddings.onlyTop,
            child: GridView.builder(
              itemCount: 6,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: MyPaddings.medium,
                  mainAxisSpacing: MyPaddings.medium),
              itemBuilder: (context, index) => const SinglePlantContainer(
                name: 'Belmondo',
                image: DecorationImage(
                    image: AssetImage('assets/images/pokrzywka.png')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
