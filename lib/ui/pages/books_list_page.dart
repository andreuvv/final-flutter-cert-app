import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cert_final/bloc/books_app_bloc.dart';
import 'package:flutter_cert_final/services/book_list_service.dart';
import 'package:flutter_cert_final/ui/pages/book_detail_page.dart';

class BooksListPage extends StatelessWidget {
  BooksListPage({super.key});
  final BookListService bookService = BookListService();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BooksAppBloc(bookService)..add(FetchBooksEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Color.fromARGB(255, 52, 122, 125),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: Colors.grey[50],
          centerTitle: true,
          title: const Text(
            'Book List',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
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
              return Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24.0,
                    mainAxisSpacing: 24.0,
                    childAspectRatio: 0.6,
                  ),
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetailPage(book: book),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  book.coverArt,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              book.author,
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              book.title,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            return const Center(child: Text('No books found. Try adding new books.'));
          },
        ),
      ),
    );
  }
}
