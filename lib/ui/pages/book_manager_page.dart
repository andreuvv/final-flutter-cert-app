import 'package:flutter/material.dart';
import 'package:flutter_cert_final/ui/pages/add_book_page.dart';
import 'package:flutter_cert_final/ui/pages/edit_books_page.dart';

class BookManagerPage extends StatelessWidget {
  const BookManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Book Manager'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddBookPage()),
                );
              },
              child: const Text('Add New Book'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditBooksPage()),
                );
              },
              child: const Text('Edit Books'),
            ),
          ],
        ),
      ),
    );
  }
}
