import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.watch_later_outlined, color: AppColors.darkGreen, size: 84),
            SizedBox(height: 24),
            Text('በወቅቱ ይመጣል', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: AppColors.textDark)),
            SizedBox(height: 12),
            Text('እንደ ቀጣይ ጊዜ የቀረው ዝርዝር ይጨምራሉ። እባክዎ በጥሩ ፈለጋ ይጠብቁ።',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.muted, fontSize: 15, height: 1.6)),
          ],
        ),
      ),
    );
  }
}
