import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/consts/shapes.dart';
import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyPaddings.onlyTop,
      child: Container(
        height: 124,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: MyRadius.medium,
        ),
        child: const Row(
          children: [
            Flexible(
              flex: 1,
              child: Center(
                child: Icon(Icons.abc),
              ),
            ),
            Flexible(
              flex: 2,
              child: Text('pogoda'),
            )
          ],
        ),
      ),
    );
  }
}
