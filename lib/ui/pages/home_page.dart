import 'package:flutter/material.dart';
import 'package:flutter_cert_final/ui/local_widgets/trending_books_widget.dart';
import 'package:flutter_cert_final/ui/pages/book_manager_page.dart';
import 'package:flutter_cert_final/ui/pages/books_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.dashboard_rounded,
            color: Color.fromARGB(255, 52, 122, 125),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const BookManagerPage(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              color: Color.fromARGB(255, 52, 122, 125),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.mic),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Trending Books',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        InkWell(
                            child: const Text(
                              'View All',
                              style: TextStyle(fontWeight: FontWeight.w500, color: Color.fromARGB(255, 52, 122, 125)),
                            ),
                            onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) => BooksListPage(),
                                  ),
                                )),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const TrendingBooksWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
