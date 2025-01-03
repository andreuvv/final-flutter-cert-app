import 'package:flutter/material.dart';

class ReadingPage extends StatelessWidget {
  const ReadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading'),
      ),
      body: const Center(
        child: Text('Reading Page'),
      ),
    );
  }
}
