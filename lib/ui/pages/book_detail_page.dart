import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cert_final/bloc/books_app_bloc.dart';
import 'package:flutter_cert_final/bloc/shopping_cart_bloc.dart';
import 'package:flutter_cert_final/models/book_model.dart';
import 'package:flutter_cert_final/ui/local_widgets/quantity_selector_widget.dart';
import 'package:flutter_cert_final/utils/app_colors.dart';
import 'package:share_plus/share_plus.dart';

class BookDetailPage extends StatelessWidget {
  final BookModel book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    int selectedQuantity = 1;
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
          'Book Detail',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.share,
              color: AppColors.teal,
            ),
            onPressed: () {
              final String bookInfo = 'Check out this book: ${book.title} by ${book.author}\n\n'
                  'Price: \$${book.price}\n'
                  'Rating: ${book.rating}\n'
                  'Pages: ${book.pageNumbers}\n'
                  'Language: ${book.language}\n\n'
                  '${book.description}';
              Share.share(bookInfo);
            },
          ),
        ],
      ),
      body: BlocBuilder<BooksAppBloc, BooksState>(
        builder: (context, state) {
          if (state is BooksLoaded) {
            final updatedBook = state.books.firstWhere((b) => b.id == book.id, orElse: () => book);
            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        updatedBook.coverArt,
                        fit: BoxFit.contain,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$${updatedBook.price}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 52, 122, 125),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                updatedBook.title,
                                style: const TextStyle(
                                  height: 0.95,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                updatedBook.favourite ? Icons.bookmark : Icons.bookmark_border,
                                color: updatedBook.favourite ? AppColors.teal : Colors.grey,
                              ),
                              onPressed: () {
                                context.read<BooksAppBloc>().add(UpdateBookEvent(
                                      updatedBook.copyWith(favourite: !updatedBook.favourite, id: updatedBook.id),
                                    ));
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          updatedBook.author,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    'Rating',
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '${updatedBook.rating}',
                                    style: const TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 24,
                                width: 1,
                                color: Colors.grey[300],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Number of Pages',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '${updatedBook.pageNumbers}',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 24,
                                width: 1,
                                color: Colors.grey[300],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Language',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    updatedBook.language,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Text(
                          updatedBook.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: QuantitySelector(
                                onQuantityChanged: (quantity) {
                                  selectedQuantity = quantity;
                                },
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            GestureDetector(
                              onTap: () {
                                for (int i = 0; i < selectedQuantity; i++) {
                                  context.read<ShoppingCartBloc>().add(AddToCartEvent(updatedBook));
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('$selectedQuantity book(s) added to cart')),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14.0,
                                  horizontal: 24.0,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.orange,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: const Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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
