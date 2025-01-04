import 'package:flutter/material.dart';
import 'package:flutter_cert_final/models/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cert_final/bloc/books_app_bloc.dart';

class EditBooksController {
  final BookModel book;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController authorController;
  late TextEditingController coverArtController;
  late TextEditingController descriptionController;
  late TextEditingController ratingController;
  late TextEditingController priceController;
  late TextEditingController pageNumbersController;
  late TextEditingController languageController;

  EditBooksController(this.book) {
    titleController = TextEditingController(text: book.title);
    authorController = TextEditingController(text: book.author);
    coverArtController = TextEditingController(text: book.coverArt);
    descriptionController = TextEditingController(text: book.description);
    ratingController = TextEditingController(text: book.rating.toString());
    priceController = TextEditingController(text: book.price.toString());
    pageNumbersController = TextEditingController(text: book.pageNumbers.toString());
    languageController = TextEditingController(text: book.language);
  }

  void dispose() {
    titleController.dispose();
    authorController.dispose();
    coverArtController.dispose();
    descriptionController.dispose();
    ratingController.dispose();
    priceController.dispose();
    pageNumbersController.dispose();
    languageController.dispose();
  }

  void saveEdits(BuildContext context) {
    if (formKey.currentState!.validate()) {
      final updatedBook = book.copyWithUpdateBook(
        title: titleController.text,
        author: authorController.text,
        coverArt: coverArtController.text,
        description: descriptionController.text,
        rating: num.parse(ratingController.text),
        price: num.parse(priceController.text),
        pageNumbers: num.parse(pageNumbersController.text),
        language: languageController.text,
        id: book.id,
      );

      context.read<BooksAppBloc>().add(UpdateBookEvent(updatedBook));
      Navigator.pop(context);
    }
  }
}
