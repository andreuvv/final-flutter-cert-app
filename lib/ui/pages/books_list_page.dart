import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cert_final/bloc/books_app_bloc.dart';
import 'package:flutter_cert_final/services/book_list_service.dart';

class BooksListPage extends StatelessWidget {
  BooksListPage({super.key});
  final BookListService bookService = BookListService();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BooksAppBloc(bookService)..add(FetchBooksEvent()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Books List'),
        ),
        body: BlocBuilder<BooksAppBloc, BooksState>(
          builder: (context, state) {
            if (state is BooksLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BooksError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is BooksLoaded) {
              final books = state.books;
              if (books.isEmpty) {
                return const Center(child: Text('No books found. Try adding new books.'));
              }
              return ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return ListTile(
                    title: Text(book.title),
                    subtitle: Text(book.author),
                  );
                },
              );
            }
            return const Center(child: Text('No books found. Try adding new books.'));
          },
        ),
      ),
    );
  }
}
