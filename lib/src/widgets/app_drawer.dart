import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.background,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: AppColors.darkGreen),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.gold,
                    child: Icon(
                      Icons.person,
                      color: AppColors.darkGreen,
                      size: 30,
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    'Ustaz Abu Imran',
                    style: TextStyle(
                      color: AppColors.textLight,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Imul Arebiya Academy',
                    style: TextStyle(color: AppColors.textLight, fontSize: 13),
                  ),
                ],
              ),
            ),
            _buildItem(context, Icons.home, 'መነሻ', '/home'),
            _buildItem(context, Icons.menu_book, 'ሳርፍ ትምህርቶች', '/lessons'),
            _buildItem(context, Icons.audiotrack, 'ኦዲዮ ተወዳድር', '/audio-player'),
            _buildItem(context, Icons.schedule, 'ቅኝ እድል', '/coming-soon'),
            const Divider(color: AppColors.muted, indent: 20, endIndent: 20),
            _buildItem(context, Icons.favorite, 'ተወዳጆች', '/favorites'),
            _buildItem(context, Icons.download, 'ውስጣዊ ውስን', '/downloads'),
            _buildItem(context, Icons.person, 'መለያ', '/profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    IconData icon,
    String title,
    String path,
  ) {
    return ListTile(
      leading: Icon(icon, color: AppColors.darkGreen),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      onTap: () {
        Navigator.pop(context);
        context.go(path);
      },
    );
  }
}
