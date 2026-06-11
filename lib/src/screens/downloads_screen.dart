import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/lesson_provider.dart';
import '../theme/app_colors.dart';
import '../widgets/lesson_card.dart';

class DownloadsScreen extends ConsumerWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloads = ref.watch(lessonsProvider).where((lesson) => lesson.isDownloaded).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('የውስጣዊ ውስን', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: AppColors.textDark)),
          ),
          const SizedBox(height: 8),
          if (downloads.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Text('ፋይሎች አልተያዙም', style: TextStyle(color: AppColors.muted)),
            )
          else
            ...downloads.map((lesson) => LessonCard(lesson: lesson)),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
