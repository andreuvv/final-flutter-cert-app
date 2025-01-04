import 'package:flutter/material.dart';
import 'package:flutter_cert_final/models/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cert_final/bloc/books_app_bloc.dart';

class AddBooksController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController authorController;
  late TextEditingController coverArtController;
  late TextEditingController descriptionController;
  late TextEditingController ratingController;
  late TextEditingController priceController;
  late TextEditingController pageNumbersController;
  late TextEditingController languageController;

  AddBooksController() {
    titleController = TextEditingController();
    authorController = TextEditingController();
    coverArtController = TextEditingController(
        text: 'https://d827xgdhgqbnd.cloudfront.net/wp-content/uploads/2016/04/09121712/book-cover-placeholder.png');
    descriptionController = TextEditingController();
    ratingController = TextEditingController();
    priceController = TextEditingController();
    pageNumbersController = TextEditingController();
    languageController = TextEditingController();
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

  void saveBook(BuildContext context) {
    if (formKey.currentState!.validate()) {
      final newBook = BookModel(
        title: titleController.text,
        author: authorController.text,
        coverArt: coverArtController.text,
        description: descriptionController.text,
        favourite: false,
        isReading: false,
        id: DateTime.now().millisecondsSinceEpoch,
        rating: num.parse(ratingController.text),
        price: num.parse(priceController.text),
        pageNumbers: num.parse(pageNumbersController.text),
        language: languageController.text,
      );

      context.read<BooksAppBloc>().add(AddBookEvent(newBook));
      Navigator.pop(context);
    }
  }
}
