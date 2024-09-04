import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/consts/shapes.dart';
import 'package:dzien_dobry/data/providers/screen_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConditionsCard extends StatelessWidget {
  final String text;
  final IconData icon;
  const ConditionsCard({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyPaddings.onlyTop,
      child: Container(
        height: 124,
        width:
            Provider.of<ScreenDimensions>(context).width - MyPaddings.large * 2,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: MyRadius.medium,
        ),
        child: Padding(
          padding: MyPaddings.weatherDotsHorizontal,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Center(
                  child: Icon(icon),
                ),
              ),
              Flexible(
                flex: 4,
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
