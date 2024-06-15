import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

List<CameraDescription>? camera;
Future<void> main() async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();
  try {
    camera = await availableCameras();
  } on CameraException catch (e) {
    print("Error: $e.code\nError Message: $e.message");
  }
  runApp(const UtechSils());
}

class UtechSils extends StatelessWidget {
  const UtechSils({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      title: "UtechSils",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text("UtechSils"),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
