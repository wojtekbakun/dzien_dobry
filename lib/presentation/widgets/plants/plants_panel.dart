import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/consts/shapes.dart';
import 'package:dzien_dobry/models/plant.dart';
import 'package:dzien_dobry/presentation/widgets/plants/input_dialog.dart';
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
  late Future<List<Plant>> futurePlant;

  @override
  void initState() {
    super.initState();
    futurePlant = PlantRepository(ApiService(baseUrl: 'http://localhost:8000'))
        .getPlantData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyPaddings.onlyTop,
      child: Column(
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
                    'Wszystkie są zadowolone!',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              const Expanded(
                child: Row(),
              ),
              ElevatedButton(
                onPressed: () => InputDialog().showInputDialog(context),
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
                  child: Icon(
                    Icons.add,
                  ),
                ),
              ),
            ],
          ),
          FutureBuilder(
              future: Future.delayed(const Duration(seconds: 2), () {
                return futurePlant;
              }),
              builder: (context, plant) {
                if (plant.hasData) {
                  return Padding(
                    padding: MyPaddings.onlyTop,
                    child: plant.data!.isEmpty
                        ? Row(
                            children: [
                              Text('Brak roślin',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ],
                          )
                        : GridView.builder(
                            itemCount: plant.data?.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: MyPaddings.medium,
                                    mainAxisSpacing: MyPaddings.medium),
                            itemBuilder: (context, index) =>
                                SinglePlantContainer(
                              plant: plant.data![index],
                              name: plant.data?[index].name ?? 'No name',
                              image: DecorationImage(
                                image: Image.network(
                                  plant.data?[index].imageLink ?? '',
                                  fit: BoxFit.cover,
                                ).image,
                              ),
                            ),
                          ),
                  );
                } else if (plant.hasError) {
                  debugPrint(plant.toString());
                  return Center(
                    child: Text(
                      'Nie udało się pobrać informacji o roślinkach, spróbuj ponownie później. \n\nTreść błędu: ${plant.error}',
                      textAlign: TextAlign.center,
                    ),
                  );
                }
                return const Center(
                  child: Padding(
                    padding: MyPaddings.symmetricVertical,
                    child: CircularProgressIndicator(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
