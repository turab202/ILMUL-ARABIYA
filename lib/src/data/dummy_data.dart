import '../models/audio_track.dart';
import '../models/lesson.dart';

const lessonCategories = ['ምርጫ', 'ሐረግ', 'አዲስ', 'የማስታወሻ'];

const lessons = [
  Lesson(
    title: 'ሳርፍ 1 - መግቢያ',
    description: 'የሳርፍ ትምህርት መጀመሪያ ክፍል',
    category: 'ምርጫ',
    duration: '12:30',
    status: 'እየተማሩ',
    isFavorite: true,
  ),
  Lesson(
    title: 'ሳርፍ 2 - ኀረግ',
    description: 'ከፍተኛ አማርኛ ጥናት',
    category: 'ሐረግ',
    duration: '08:45',
    status: 'አጠናቀቀ',
    isDownloaded: true,
  ),
  Lesson(
    title: 'ሳርፍ 3 - ማስታወሻ',
    description: 'ክፍል አስፈላጊ ነጥቦች',
    category: 'የማስታወሻ',
    duration: '15:10',
    status: 'ለማስታወሻ',
    isLocked: true,
  ),
  Lesson(
    title: 'ሳርፍ 4 - ተወላጅ',
    description: 'ፕሮግራም ለሚገባ ማስተላለፊያ',
    category: 'አዲስ',
    duration: '09:20',
    status: 'እየተማሩ',
  ),
];

const audioTracks = [
  AudioTrack(
    title: 'እምነት ትምህርት',
    subtitle: 'በኡስታዝ አቡ ኢምራን',
    url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
    artwork:
        'https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&w=400&q=80',
    duration: Duration(minutes: 4, seconds: 16),
  ),
  AudioTrack(
    title: 'እንደ ማስታወሻ',
    subtitle: 'የምስራቅ አርእስት',
    url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
    artwork:
        'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=400&q=80',
    duration: Duration(minutes: 5, seconds: 4),
  ),
  AudioTrack(
    title: 'ግንዛቤ ሙዚቃ',
    subtitle: 'የሰርፍ ማዕከላዊ',
    url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
    artwork:
        'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?auto=format&fit=crop&w=400&q=80',
    duration: Duration(minutes: 3, seconds: 58),
  ),
];
