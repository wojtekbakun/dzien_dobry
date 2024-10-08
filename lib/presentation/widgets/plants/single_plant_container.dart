import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/consts/shapes.dart';
import 'package:dzien_dobry/models/plant.dart';
import 'package:dzien_dobry/presentation/screens/plant_screen.dart';
import 'package:flutter/material.dart';

class SinglePlantContainer extends StatelessWidget {
  final String name;
  final DecorationImage image;
  final Plant plant;
  const SinglePlantContainer(
      {super.key,
      required this.name,
      required this.image,
      required this.plant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (context) {
        return PlantScreen(plant: plant);
      })),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: MyRadius.medium,
          color: Theme.of(context).cardColor,
          image: DecorationImage(
            image: image.image,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Flexible(
              flex: 4,
              child: SizedBox(),
            ),
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: MyRadius.medium.bottomLeft,
                    bottomRight: MyRadius.medium.bottomRight,
                  ),
                  color: Theme.of(context).cardColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: MyPaddings.smallAll,
                      child: Text(
                        name.toUpperCase(),
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
