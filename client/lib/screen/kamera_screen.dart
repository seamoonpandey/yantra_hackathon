import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class KameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const KameraPage(
    this.cameras, {
    super.key,
  });

  @override
  State<KameraPage> createState() => _KameraPageState();
}

class _KameraPageState extends State<KameraPage> {
  late List<dynamic> _recognitions;
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
