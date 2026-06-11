import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/lesson.dart';
import '../providers/lesson_provider.dart';
import '../theme/app_colors.dart';
import '../widgets/category_chip.dart';
import '../widgets/lesson_card.dart';
import '../widgets/search_input.dart';
import '../widgets/section_header.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String selectedCategory = 'ምርጫ';
  String searchTerm = '';

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoriesProvider);
    final lessons = ref.watch(lessonsProvider);
    final filteredLessons = lessons.where((lesson) {
      final matchesCategory = selectedCategory == 'ምርጫ' || lesson.category == selectedCategory;
      final matchesSearch = lesson.title.contains(searchTerm) || lesson.description.contains(searchTerm);
      return matchesCategory && (searchTerm.isEmpty || matchesSearch);
    }).toList();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: AppColors.darkGreen,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('እንኳን ደህና መጣህ', style: TextStyle(color: AppColors.textLight, fontSize: 20, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                const Text('ዛሬ የሚመከሩ ሳርፍ ትምህርቶችን ይምረጡ', style: TextStyle(color: AppColors.textLight, fontSize: 14)),
                const SizedBox(height: 24),
                SearchInput(
                  hintText: 'የሚፈልጉትን ጽሑፍ ያስገቡ',
                  onChanged: (value) => setState(() => searchTerm = value),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 52,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return CategoryChip(
                    label: category,
                    selected: selectedCategory == category,
                    onTap: () => setState(() => selectedCategory = category),
                  );
                },
              ),
            ),
          ),
          const SectionHeader(title: 'ዝርዝር ሳርፍ ትምህርቶች', actionLabel: 'ሁሉን እይ', onAction: null),
          ...filteredLessons.map((lesson) => LessonCard(
                lesson: lesson,
                onTap: () => context.push('/lessons'),
              )),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
