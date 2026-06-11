import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () => context.go('/home'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGreen,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircleAvatar(
              radius: 72,
              backgroundColor: AppColors.gold,
              child: Icon(Icons.menu_book_rounded, color: AppColors.darkGreen, size: 64),
            ),
            SizedBox(height: 24),
            Text('እልሙል አረቢያ', style: TextStyle(color: AppColors.textLight, fontSize: 28, fontWeight: FontWeight.w800)),
            SizedBox(height: 12),
            Text('የሳርፍ ትምህርቶች እና የኦዲዮ ትዕዛዝ',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textLight, fontSize: 14, height: 1.5)),
          ],
        ),
      ),
    );
  }
}
