import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/models/plant.dart';
import 'package:dzien_dobry/presentation/widgets/plants/monitoring_device_data.dart';
import 'package:dzien_dobry/presentation/widgets/plants/plant_description.dart';
import 'package:dzien_dobry/presentation/widgets/plants/plant_image_card.dart';
import 'package:dzien_dobry/presentation/widgets/plants/to_do_panel.dart';
import 'package:flutter/material.dart';

class PlantScreen extends StatelessWidget {
  final Plant? plant;
  const PlantScreen({super.key, this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: MyPaddings.symmetricHorizontal,
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Padding(
                          padding: MyPaddings.weatherDotsHorizontal,
                          child: Text('Powrót'),
                        ),
                      ],
                    ),
                    // PLant Image Card
                    PlantImageCard(
                      plantName: plant!.name[0].toUpperCase() +
                          plant!.name.substring(1),
                      secondName: plant!.scientificName,
                      image: Image.network(plant!.imageLink),
                    ),
                    // Plant description card
                    // const PlantDescription(
                    //   description:
                    //       'Pokrzywki to rośliny, które najlepiej wytępić. Warto tez podlewać je, wtedy będą rosły jak szalone.',
                    // ),
                  ],
                ),
              ),
              Row(
                children: [
                  ToDoPanel(toDos: plant!.toDos),
                ],
              ),
              MonitoringDeviceData(sensorData: plant!.data),
            ],
          ),
        ),
      ),
    );
  }
}
