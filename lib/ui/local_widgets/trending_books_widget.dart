import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cert_final/bloc/books_app_bloc.dart';
import 'package:flutter_cert_final/ui/pages/book_detail_page.dart';

class TrendingBooksWidget extends StatelessWidget {
  const TrendingBooksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksAppBloc, BooksState>(
      builder: (context, state) {
        if (state is BooksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BooksError) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is BooksLoaded) {
          final books = state.books;
          final randomBooks = (books..shuffle()).take(5).toList();

          return CarouselSlider.builder(
            itemCount: randomBooks.length,
            itemBuilder: (context, index, realIndex) {
              final book = randomBooks[index];
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
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            book.coverArt,
                            //fit: BoxFit.contain,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "by ${book.author}",
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        book.title,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 300.0,
              //enlargeCenterPage: true,
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(seconds: 1),
              viewportFraction: 0.45,
            ),
          );
        }
        return const Center(child: Text('No books found.'));
      },
    );
  }
}
