import 'package:flutter/material.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
      ),
      body: const Center(
        child: Text('Bookmarks Page'),
      ),
    );
  }
}
