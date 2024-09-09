import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/consts/shapes.dart';
import 'package:dzien_dobry/models/plant.dart';
import 'package:dzien_dobry/presentation/widgets/plants/single_plant_container.dart';
import 'package:dzien_dobry/repository/plant_repository.dart';
import 'package:dzien_dobry/service/api_service.dart';
import 'package:flutter/material.dart';

class PlantsPanel extends StatefulWidget {
  const PlantsPanel({super.key});

  @override
  State<PlantsPanel> createState() => _PlantsPanelState();
}

class _PlantsPanelState extends State<PlantsPanel> {
  String _inputText = '';
  late Future<List<Plant>> futurePlant;

  @override
  void initState() {
    super.initState();
    futurePlant = PlantRepository(ApiService(baseUrl: 'http://127.0.0.1:5000'))
        .getPlantData();
  }

  Future<void> _showInputDialog() async {
    TextEditingController controller = TextEditingController();

    @override
    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Nadaj roślince nazwę',
              style: Theme.of(context).textTheme.titleSmall),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
                hintText: "Np. belmondo",
                hintStyle: Theme.of(context).textTheme.labelSmall),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Anulowanie i zamknięcie dialogu
              },
              child: const Text('Powrót'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(
                      controller.text); // Zwrócenie tekstu i zamknięcie dialogu
                },
                child: TextButton(
                  onPressed: () async {
                    await PlantRepository(
                            ApiService(baseUrl: 'http://127.0.0.1:5000'))
                        .addPlant('name');
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('OK'),
                )),
          ],
        );
      },
    );

    if (result != null && result.isNotEmpty) {
      setState(() {
        _inputText = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyPaddings.onlyTop,
      child: FutureBuilder(
          future: futurePlant,
          builder: (context, plant) {
            if (plant.hasData) {
              return Column(
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Twoje rośliny',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Wszystkie są zadowolone!}',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      const Expanded(
                        child: Row(),
                      ),
                      ElevatedButton(
                        onPressed: _showInputDialog,
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: MyRadius.small,
                            ),
                          ),
                          backgroundColor: WidgetStateProperty.all(
                            Theme.of(context).cardColor,
                          ),
                        ),
                        child: const Padding(
                          padding: MyPaddings.smallAll,
                          child: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: MyPaddings.onlyTop,
                    child: GridView.builder(
                      itemCount: plant.data?.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: MyPaddings.medium,
                              mainAxisSpacing: MyPaddings.medium),
                      itemBuilder: (context, index) => SinglePlantContainer(
                        name: plant.data?[index].name ?? 'No name',
                        image: DecorationImage(
                            image: AssetImage('assets/images/pokrzywka.png')),
                      ),
                    ),
                  ),
                ],
              );
            } else if (plant.hasError) {
              return Center(
                child: Text('error: ${plant.error}'),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
