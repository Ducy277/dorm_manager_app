import 'package:flutter/material.dart';

/// Temporary screen for the parking feature.
///
/// At present this screen simply informs the user that parking
/// functionality is under development. Once implemented, it can be
/// replaced with the appropriate UI and logic.
class ParkingScreen extends StatelessWidget {
  const ParkingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nhà xe'),
      ),
      body: const Center(
        child: Text('Tính năng nhà xe đang được phát triển.'),
      ),
    );
  }
}