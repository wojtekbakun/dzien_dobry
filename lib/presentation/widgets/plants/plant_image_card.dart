import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/consts/shapes.dart';
import 'package:dzien_dobry/data/providers/screen_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlantImageCard extends StatelessWidget {
  final ImageProvider image;
  final String plantName;
  final String secondName;
  const PlantImageCard(
      {super.key,
      required this.image,
      required this.plantName,
      required this.secondName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Provider.of<ScreenDimensions>(context).height / 2.5,
      decoration: BoxDecoration(
        borderRadius: MyRadius.medium,
        color: Theme.of(context).cardColor,
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: MyRadius.medium.bottomLeft,
                bottomRight: MyRadius.medium.bottomRight,
              ),
              color: Theme.of(context).cardColor,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: MyPaddings.largeAll,
                      child: Column(
                        children: [
                          Text(
                            plantName,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(secondName),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
