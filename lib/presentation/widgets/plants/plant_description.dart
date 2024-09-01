import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/consts/shapes.dart';
import 'package:flutter/material.dart';

class PlantDescription extends StatelessWidget {
  final String description;
  const PlantDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyPaddings.onlyTop,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: MyRadius.medium,
          color: Theme.of(context).cardColor,
        ),
        child: Padding(
          padding: MyPaddings.symmetricVertical,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                flex: 1,
                child: Icon(Icons.info_outline),
              ),
              Expanded(flex: 6, child: Text(description)),
            ],
          ),
        ),
      ),
    );
  }
}
