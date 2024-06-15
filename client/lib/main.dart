import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:utechseel/routes/route.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
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
      initialRoute: Routes.home,
      onGenerateRoute: Routes.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
