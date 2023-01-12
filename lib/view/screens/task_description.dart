import 'package:flutter/material.dart';

class NotifiedPage extends StatelessWidget {
  const NotifiedPage({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
