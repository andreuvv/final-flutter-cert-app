import 'package:flutter/material.dart';
import 'package:flutter_cert_final/ui/local_widgets/bottom_navbar_widget.dart';
import 'package:flutter_cert_final/utils/app_colors.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey50,
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.arrow_back_rounded,
        //     color: AppColors.teal,
        //   ),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        backgroundColor: AppColors.grey50,
        centerTitle: true,
        title: const Text(
          'Bookmarks',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: const Column(
        children: [
          Text('Bookmarks Page'),
          Spacer(),
          BottomNavbar(),
        ],
      ),
    );
  }
}
