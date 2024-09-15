import 'dart:io';
import 'package:dzien_dobry/data/image_picker.dart';
import 'package:dzien_dobry/repository/plant_repository.dart';
import 'package:dzien_dobry/service/api_service.dart';
import 'package:flutter/material.dart';

class InputDialog {
  Future<void> showInputDialog(BuildContext context) async {
    TextEditingController controller = TextEditingController();
    File image = File('');

    void chooseAndUploadImage() async {
      var xImage = await MyImagePicker().pickImageFromGallery();
      if (xImage != null) {
        image = File(xImage.path);
      }
    }

    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Nadaj roślince nazwę',
              style: Theme.of(context).textTheme.titleSmall),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                    hintText: "Np. belmondo",
                    hintStyle: Theme.of(context).textTheme.labelSmall),
              ),
              TextButton(
                  onPressed: () {
                    chooseAndUploadImage();
                  },
                  child: const Text('Dodaj fotkę roślinki')),
            ],
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
                        .addPlant(
                      controller.text,
                      image,
                    )
                        .whenComplete(() {
                      if (context.mounted) {
                        Navigator.of(context).pop();
                        debugPrint('Plant added, dialog closed');
                      }
                    });
                  },
                  child: const Text('OK'),
                )),
          ],
        );
      },
    );
  }
}
