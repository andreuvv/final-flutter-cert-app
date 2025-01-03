import 'package:flutter/material.dart';
import 'package:flutter_cert_final/models/book_model.dart';
import 'package:flutter_cert_final/utils/app_colors.dart';
import 'package:share_plus/share_plus.dart';

class BookDetailPage extends StatelessWidget {
  final BookModel book;

  const BookDetailPage({super.key, required this.book});

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
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  book.coverArt,
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
                    '\$${book.price}',
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
                          book.title,
                          style: const TextStyle(
                            height: 0.95,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColors.teal,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            size: 20,
                            Icons.bookmark_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    book.author,
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
                              '${book.rating}',
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
                              '${book.pageNumbers}',
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
                              book.language,
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
                    book.description,
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
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'QTY',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Container(
                                height: 24,
                                width: 1,
                                color: Colors.grey[300],
                              ),
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {},
                              ),
                              const Text(
                                '1',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.teal,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      GestureDetector(
                        onTap: () {},
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
      ),
    );
  }
}
