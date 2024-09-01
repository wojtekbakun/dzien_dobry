import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/presentation/widgets/plants/monitoring_device_data.dart';
import 'package:dzien_dobry/presentation/widgets/plants/plant_description.dart';
import 'package:dzien_dobry/presentation/widgets/plants/plant_image_card.dart';
import 'package:dzien_dobry/presentation/widgets/plants/to_do_panel.dart';
import 'package:flutter/material.dart';

class PlantScreen extends StatelessWidget {
  const PlantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
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
              const PlantImageCard(
                plantName: 'Pokrzywka',
                secondName: 'Judasus belmondus',
                image: AssetImage(
                  'assets/images/pokrzywka.png',
                ),
              ),
              // Plant description card
              const PlantDescription(
                description:
                    'Pokrzywki to rośliny, które najlepiej wytępić. Warto tez podlewać je, wtedy będą rosły jak szalone.',
              ),
              const ToDoPanel(
                toDos: [
                  'Podlanie',
                  'Kichanie',
                  'Zabawa',
                  'Zabawa',
                  'Zabawa',
                  'Podlanie',
                  'Kichanie',
                  'Zabawa',
                  'Zabawa',
                  'Zabawa'
                ],
              ),
              MonitoringDeviceData(),
            ],
          ),
        ),
      ),
    );
  }
}
