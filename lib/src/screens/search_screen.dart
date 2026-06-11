import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/lesson.dart';
import '../providers/lesson_provider.dart';
import '../theme/app_colors.dart';
import '../widgets/lesson_card.dart';
import '../widgets/search_input.dart';
import '../widgets/section_header.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final lessons = ref.watch(lessonsProvider);
    final results = lessons.where((lesson) {
      final lower = query.toLowerCase();
      return lesson.title.toLowerCase().contains(lower) || lesson.description.toLowerCase().contains(lower) || lesson.category.toLowerCase().contains(lower);
    }).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('ፈልግ', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: AppColors.textDark)),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchInput(
              hintText: 'ሳርፍ ወይም እርስዎን በማስተላለፊያ የሚለውን ያስገቡ',
              onChanged: (value) => setState(() => query = value),
            ),
          ),
          const SectionHeader(title: 'የፍለጋ ውጤቶች', actionLabel: ''),
          if (results.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Text('ከዚህ በላይ ምንም አልተገኘም', style: TextStyle(color: AppColors.muted)),
            )
          else
            ...results.map((lesson) => LessonCard(lesson: lesson)),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
