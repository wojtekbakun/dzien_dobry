import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
      ),
      child: Container(
        height: 124,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
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
