import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/consts/shapes.dart';
import 'package:flutter/material.dart';

class MeasurementCard extends StatelessWidget {
  final String measurement;
  final List measurementType;
  final IconData icon;
  const MeasurementCard({
    super.key,
    required this.measurement,
    required this.measurementType,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      width: 124,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          shape: BoxShape.rectangle,
          borderRadius: MyRadius.medium),
      child: Container(
        margin: MyPaddings.smallAll,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(MyPaddings.small)),
                child: Padding(
                  padding: MyPaddings.smallAll,
                  child: Icon(
                    icon,
                    size: 34,
                    color: Theme.of(context).indicatorColor,
                  ),
                )),
            Text(
              measurementType[1],
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(measurement, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
