import 'package:dzien_dobry/consts/paddings.dart';
import 'package:flutter/material.dart';

class MonitoringDeviceData extends StatelessWidget {
  const MonitoringDeviceData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyPaddings.onlyTop,
      child: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dane z urządzenia monitorującego:'),
            Flexible(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Temp'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
