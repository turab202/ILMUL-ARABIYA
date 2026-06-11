import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/lesson.dart';
import '../providers/lesson_provider.dart';
import '../theme/app_colors.dart';
import '../widgets/lesson_card.dart';
import '../widgets/section_header.dart';

class LessonsScreen extends ConsumerWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessons = ref.watch(lessonsProvider);
    final unlocked = lessons.where((item) => !item.isLocked).toList();
    final locked = lessons.where((item) => item.isLocked).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('ሳርፍ ትምህርቶች', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: AppColors.textDark)),
          ),
          const SizedBox(height: 16),
          const SectionHeader(title: 'ተወዳጅ ሳርፍ ስርዓቶች', actionLabel: 'ሁሉን ሌላ', onAction: null),
          ...unlocked.map((lesson) => LessonCard(lesson: lesson)),
          const SectionHeader(title: 'የተዘገየ ሳርፍ', actionLabel: ''),
          ...locked.map((lesson) => LessonCard(lesson: lesson)),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
