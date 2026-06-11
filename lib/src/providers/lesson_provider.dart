import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/dummy_data.dart';
import '../models/lesson.dart';

final lessonsProvider = Provider<List<Lesson>>((ref) => lessons);
final categoriesProvider = Provider<List<String>>((ref) => lessonCategories);
