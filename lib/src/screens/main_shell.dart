import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';
import '../widgets/app_drawer.dart';
import '../widgets/mini_player.dart';

class MainShell extends StatelessWidget {
  final Widget child;
  final String currentLocation;

  const MainShell({super.key, required this.child, required this.currentLocation});

  int _indexFromLocation(String location) {
    if (location.startsWith('/search')) return 1;
    if (location.startsWith('/favorites')) return 2;
    if (location.startsWith('/downloads')) return 3;
    if (location.startsWith('/profile')) return 4;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _indexFromLocation(currentLocation);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('እልሙል አረቢያ'),
        backgroundColor: AppColors.darkGreen,
      ),
      drawer: const AppDrawer(),
      body: child,
      bottomNavigationBar: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const MiniPlayer(),
            BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                switch (index) {
                  case 0:
                    context.go('/home');
                    break;
                  case 1:
                    context.go('/search');
                    break;
                  case 2:
                    context.go('/favorites');
                    break;
                  case 3:
                    context.go('/downloads');
                    break;
                  case 4:
                    context.go('/profile');
                    break;
                }
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'መነሻ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined),
                  label: 'ፈሊግ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  label: 'ተወዳጆች',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.download_outlined),
                  label: 'እድል',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'መለያ',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
