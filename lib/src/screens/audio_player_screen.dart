import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/audio_provider.dart';
import '../theme/app_colors.dart';
import '../widgets/audio_controls.dart';

class AudioPlayerScreen extends ConsumerStatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  ConsumerState<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends ConsumerState<AudioPlayerScreen> {
  double _sliderPosition = 0;

  @override
  Widget build(BuildContext context) {
    final currentItemAsync = ref.watch(currentMediaItemProvider);
    final playbackStateAsync = ref.watch(playbackStateProvider);
    final playbackSpeed = ref.watch(playbackSpeedProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: currentItemAsync.when(
          data: (item) {
            if (item == null) {
              return const Center(
                child: Text(
                  'የሙዚቃ እቃ አልተወሰነም',
                  style: TextStyle(color: AppColors.textDark),
                ),
              );
            }

            final state = playbackStateAsync.value;
            final position = state?.updatePosition ?? Duration.zero;
            final duration = item.duration ?? const Duration(minutes: 1);
            final displayPosition = position.inMilliseconds.clamp(0, duration.inMilliseconds).toDouble();

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.darkGreen),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text(
                        'ኦዲዮ ተጫዋች',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textDark),
                      ),
                      const SizedBox(width: 40),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: Image.network(
                        item.artUri.toString(),
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    item.title,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: AppColors.textDark),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.artist ?? '',
                    style: const TextStyle(fontSize: 16, color: AppColors.muted),
                  ),
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Slider(
                        min: 0,
                        max: duration.inMilliseconds.toDouble(),
                        value: displayPosition,
                        onChanged: (value) {
                          setState(() => _sliderPosition = value);
                        },
                        onChangeEnd: (value) {
                          ref.read(audioHandlerProvider).seek(Duration(milliseconds: value.toInt()));
                        },
                        activeColor: AppColors.gold,
                        inactiveColor: AppColors.card,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_formatDuration(position), style: const TextStyle(color: AppColors.muted)),
                            Text(_formatDuration(duration), style: const TextStyle(color: AppColors.muted)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const AudioControls(),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ፕሌይቶን ፕሮግራም',
                          style: TextStyle(color: AppColors.darkGreen, fontWeight: FontWeight.w700),
                        ),
                        Text('${playbackSpeed.toStringAsFixed(1)}x', style: const TextStyle(color: AppColors.muted)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => const Center(child: Text('እባክዎ እንደገና ይሞክሩ')),
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
