import 'package:flutter/material.dart';
import 'package:flutter_cert_final/ui/local_widgets/bottom_navbar_widget.dart';
import 'package:flutter_cert_final/ui/local_widgets/currently_reading_book_widget.dart';
import 'package:flutter_cert_final/ui/local_widgets/search_bar_widget.dart';
import 'package:flutter_cert_final/ui/local_widgets/trending_books_widget.dart';
import 'package:flutter_cert_final/ui/pages/book_manager_page.dart';
import 'package:flutter_cert_final/ui/pages/books_list_page.dart';
import 'package:flutter_cert_final/utils/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.grey50,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.grey50,
        leading: IconButton(
          icon: const Icon(
            Icons.dashboard_rounded,
            color: AppColors.teal,
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
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: AppColors.teal,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              color: AppColors.teal,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SearchBarWidget(),
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
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.teal,
                          ),
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => BooksListPage(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const TrendingBooksWidget(),
                ],
              ),
            ),
            const Spacer(),
            Stack(
              children: [
                Container(
                  height: screenHeight * 0.35,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    color: AppColors.teal,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 4),
                        Icon(
                          Icons.drag_handle_rounded,
                          color: Colors.white.withOpacity(0.8),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Continue Reading',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.8),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.more_horiz,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const CurrentlyReadingBook(),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: BottomNavbar(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
