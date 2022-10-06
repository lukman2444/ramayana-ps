import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        child: QrImage(
          data: "1234567890",
          version: QrVersions.auto,
          size: 200.0,
        ),
      ),
    ));
  }
}
