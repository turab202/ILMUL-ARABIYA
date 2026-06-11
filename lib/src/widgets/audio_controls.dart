import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/audio_provider.dart';
import '../theme/app_colors.dart';

class AudioControls extends ConsumerWidget {
  const AudioControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioHandler = ref.watch(audioHandlerProvider);
    final playbackState = ref.watch(playbackStateProvider).value;
    final isPlaying = playbackState?.playing ?? false;
    final repeatEnabled = ref.watch(repeatModeProvider);
    final speed = ref.watch(playbackSpeedProvider);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              iconSize: 34,
              icon: const Icon(Icons.skip_previous, color: AppColors.textDark),
              onPressed: audioHandler.skipToPrevious,
            ),
            IconButton(
              iconSize: 56,
              icon: Icon(
                isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                color: AppColors.gold,
              ),
              onPressed: isPlaying ? audioHandler.pause : audioHandler.play,
            ),
            IconButton(
              iconSize: 34,
              icon: const Icon(Icons.skip_next, color: AppColors.textDark),
              onPressed: audioHandler.skipToNext,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildToggle(
              context,
              label: 'Repeat',
              active: repeatEnabled,
              onTap: () =>
                  ref.read(repeatModeProvider.notifier).state = !repeatEnabled,
            ),
            _buildToggle(
              context,
              label: '${speed}x',
              active: false,
              onTap: () => _cycleSpeed(ref),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildToggle(
    BuildContext context, {
    required String label,
    required bool active,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: active ? AppColors.darkGreen : AppColors.card,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: active ? AppColors.textLight : AppColors.textDark,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  void _cycleSpeed(WidgetRef ref) {
    final notifier = ref.read(playbackSpeedProvider.notifier);
    final nextSpeed = switch (ref.read(playbackSpeedProvider)) {
      1.0 => 1.5,
      1.5 => 2.0,
      _ => 1.0,
    };
    notifier.state = nextSpeed;
    ref.read(audioHandlerProvider).setSpeed(nextSpeed);
  }
}
