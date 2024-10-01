import 'dart:io';
import 'package:dzien_dobry/data/image_picker.dart';
import 'package:dzien_dobry/repository/plant_repository.dart';
import 'package:dzien_dobry/service/api_service.dart';
import 'package:flutter/material.dart';

class InputDialog {
  void showInputDialog(
    BuildContext context,
  ) async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return const DialogStateful();
      },
    );
  }
}

class DialogStateful extends StatefulWidget {
  const DialogStateful({
    super.key,
  });

  @override
  State<DialogStateful> createState() => _DialogStatefulState();
}

class _DialogStatefulState extends State<DialogStateful> {
  TextEditingController controller = TextEditingController();
  File image = File('');
  bool isTextInController = false;
  bool isImageChosen = false;

  void chooseAndUploadImage() async {
    var xImage = await MyImagePicker().pickImageFromGallery();
    if (xImage != null) {
      image = File(xImage.path);

      setState(() {
        isImageChosen = true;
      });
    }
  }

  bool isSending = false;

  void setIsSending(bool value) {
    setState(() {
      isSending = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Text(
            'Nadaj roślince nazwę',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          isTextInController ? Icon(Icons.done) : const SizedBox(),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller,
            onChanged: (value) => controller.text.isNotEmpty
                ? setState(() {
                    isTextInController = true;
                  })
                : setState(() {
                    isTextInController = false;
                  }),
            decoration: InputDecoration(
                hintText: "Np. belmondo",
                hintStyle: Theme.of(context).textTheme.labelSmall),
          ),
          TextButton(
              onPressed: () {
                chooseAndUploadImage();
              },
              iconAlignment: IconAlignment.start,
              child: Row(
                children: [
                  const Text('Dodaj fotkę roślinki'),
                  isImageChosen ? const Icon(Icons.done) : const SizedBox(),
                ],
              )),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            isSending
                ? null
                : Navigator.of(context)
                    .pop(); // Anulowanie i zamknięcie dialogu
          },
          child: isSending ? const SizedBox() : const Text('Powrót'),
        ),
        TextButton(
          onPressed: isImageChosen && isTextInController
              ? () async {
                  setIsSending(true);
                  await PlantRepository(
                          ApiService(baseUrl: 'http://localhost:8000'))
                      .addPlant(
                    controller.text,
                    image,
                  )
                      .then(
                    (value) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Roślinka dodana!'),
                          ),
                        );
                        setIsSending(false);
                        Navigator.of(context).pop();
                      }
                    },
                  );
                }
              : null,
          child:
              isSending ? const CircularProgressIndicator() : const Text('OK'),
        ),
      ],
    );
  }
}
