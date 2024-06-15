import 'package:flutter/material.dart';
import 'package:utechseel/screen/home_screen.dart';

class Routes {
  static const String home = "/";

  static Route<dynamic> generateRoute(final RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
