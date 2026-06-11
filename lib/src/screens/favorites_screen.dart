import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/lesson_provider.dart';
import '../theme/app_colors.dart';
import '../widgets/lesson_card.dart';
import '../widgets/section_header.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref
        .watch(lessonsProvider)
        .where((lesson) => lesson.isFavorite)
        .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'ተወዳጆች',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const SectionHeader(title: 'እነዚህ የተመረጡ ትምህርቶች ናቸው'),
          if (favorites.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Text(
                'ከዚህ በላይ የሚወዳዱ ትምህርቶች የሉም',
                style: TextStyle(color: AppColors.muted),
              ),
            )
          else
            ...favorites.map((lesson) => LessonCard(lesson: lesson)),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
