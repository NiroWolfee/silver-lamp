import 'package:gait_analysis/pages/navbar/discover_page.dart';
import 'package:gait_analysis/pages/navbar/likes_page.dart';
import 'package:gait_analysis/pages/navbar/search_page.dart';
import 'package:gait_analysis/pages/navbar/settings_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gait_analysis/util/cards.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final colors = [
    Colors.deepPurple,
    Colors.green,
    Colors.red,
  ];

  final user = FirebaseAuth.instance.currentUser!;

  late final SwipableStackController _controller;

  void _listenController() => setState(() {});

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController()..addListener(_listenController);
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_listenController)
      ..dispose();
  }

  final List<Widget> _pages = [
    DiscoverPage(),
    LikesPage(),
    SearchPage(),
    SettingsPage(),
  ];

  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20.0),
            child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              padding: EdgeInsets.all(16),
              gap: 8,
              onTabChange: (index) {
                _selectedPageIndex = index;
                setState(() {});
              },
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: 'Likes',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                ),
              ],
            ),
          ),
        ),
        body: _pages[_selectedPageIndex]);
  }
}
