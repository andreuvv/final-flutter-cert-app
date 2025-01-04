import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cert_final/bloc/navigation_bloc.dart';
import 'package:flutter_cert_final/ui/pages/bookmarks_page.dart';
import 'package:flutter_cert_final/ui/pages/home_page.dart';
import 'package:flutter_cert_final/ui/pages/reading_page.dart';
import 'package:flutter_cert_final/utils/app_colors.dart';
import 'package:flutter_cert_final/utils/page_route_transitions.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  void _navigateTo(BuildContext context, Widget page) {
    if (ModalRoute.of(context)?.settings.name != page.runtimeType.toString()) {
      Navigator.pushReplacement(context, fadeTransitionRoute(page));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        int _activeIndex;
        if (state is ExploreState) {
          _activeIndex = 0;
        } else if (state is ReadingState) {
          _activeIndex = 1;
        } else if (state is BookmarkState) {
          _activeIndex = 2;
        } else {
          _activeIndex = 0;
        }

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  context.read<NavigationBloc>().add(NavigateToExplore());
                  _navigateTo(context, const HomePage());
                },
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.explore,
                        color: _activeIndex == 0 ? AppColors.orange : Colors.grey,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Explore',
                        style: TextStyle(
                          color: _activeIndex == 0 ? AppColors.orange : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  context.read<NavigationBloc>().add(NavigateToReading());
                  _navigateTo(context, const ReadingPage());
                },
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.menu_book,
                        color: _activeIndex == 1 ? AppColors.orange : Colors.grey,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Reading',
                        style: TextStyle(
                          color: _activeIndex == 1 ? AppColors.orange : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  context.read<NavigationBloc>().add(NavigateToBookmark());
                  _navigateTo(context, const BookmarksPage());
                },
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bookmark,
                        color: _activeIndex == 2 ? AppColors.orange : Colors.grey,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Bookmark',
                        style: TextStyle(
                          color: _activeIndex == 2 ? AppColors.orange : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
