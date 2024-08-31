import 'package:dzien_dobry/data/providers/screen_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProvidersInit extends StatelessWidget {
  final Widget child;
  const ProvidersInit({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final screenDimensions = ScreenDimensions(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ScreenDimensions>.value(
          value: screenDimensions,
        ),
      ],
      child: child,
    );
  }
}
