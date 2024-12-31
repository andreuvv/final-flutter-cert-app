import 'package:flutter/material.dart';

class AddBookPage extends StatelessWidget {
  const AddBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add New Book'),
      ),
      body: Center(
        child: Text('Form to add a new book will go here'),
      ),
    );
  }
}
