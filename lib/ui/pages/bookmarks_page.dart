import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cert_final/bloc/books_app_bloc.dart';
import 'package:flutter_cert_final/ui/local_widgets/bottom_navbar_widget.dart';
import 'package:flutter_cert_final/utils/app_colors.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey50,
      appBar: AppBar(
        backgroundColor: AppColors.grey50,
        centerTitle: true,
        title: const Text(
          'Bookmarks',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: BlocBuilder<BooksAppBloc, BooksState>(
        builder: (context, state) {
          if (state is BooksLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BooksLoaded) {
            final books = state.books;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      final book = books[index];
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            book.coverArt,
                            //width: 50,
                            //height: 80,
                            fit: BoxFit.contain,
                          ),
                        ),
                        title: Text(
                          book.title,
                          style: const TextStyle(
                            height: 0.95,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          book.author,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            book.favourite ? Icons.bookmark : Icons.bookmark_border,
                            color: book.favourite ? AppColors.teal : Colors.grey,
                          ),
                          onPressed: () {
                            context.read<BooksAppBloc>().add(UpdateBookEvent(
                                  book.copyWith(favourite: !book.favourite, id: book.id),
                                ));
                          },
                        ),
                      );
                    },
                  ),
                ),
                const BottomNavbar(),
              ],
            );
          } else if (state is BooksError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('No books found'));
          }
        },
      ),
    );
  }
}
