import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('መለያ', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: AppColors.textDark)),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CircleAvatar(radius: 36, backgroundColor: AppColors.secondaryGreen, child: Icon(Icons.person, color: AppColors.textLight, size: 30)),
                    SizedBox(height: 16),
                    Text('Ustaz Abu Imran', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textDark)),
                    SizedBox(height: 8),
                    Text('User ID: 012345', style: TextStyle(color: AppColors.muted)),
                    SizedBox(height: 18),
                    Text('የእልሙል ተጠቃሚ፣ በቀላሉ የኦዲዮ ትምህርቶችን ይሰሙ።', style: TextStyle(color: AppColors.textDark, height: 1.5)),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildTile(Icons.settings, 'ቅንብሮች'),
          _buildTile(Icons.security, 'ጥበቃ'),
          _buildTile(Icons.help_outline, 'እገዛ'),
          _buildTile(Icons.logout, 'ውጣ'),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildTile(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: ListTile(
        tileColor: AppColors.card,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        leading: Icon(icon, color: AppColors.darkGreen),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const Icon(Icons.chevron_right, color: AppColors.muted),
        onTap: () {},
      ),
    );
  }
}
