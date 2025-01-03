import 'package:flutter/material.dart';
import 'package:flutter_cert_final/ui/pages/add_book_page.dart';
import 'package:flutter_cert_final/ui/pages/edit_books_page.dart';
import 'package:flutter_cert_final/utils/app_colors.dart';

class BookManagerPage extends StatelessWidget {
  const BookManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey50,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: AppColors.teal,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.grey50,
        centerTitle: true,
        title: const Text(
          'Book Manager',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
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
