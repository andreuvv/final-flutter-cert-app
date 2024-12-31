import 'package:flutter/material.dart';

class EditBooksPage extends StatelessWidget {
  const EditBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit Books'),
      ),
      body: Center(
        child: Text('List of books to edit will go here'),
      ),
    );
  }
}
