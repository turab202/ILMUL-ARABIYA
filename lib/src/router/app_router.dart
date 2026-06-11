import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../screens/audio_player_screen.dart';
import '../screens/coming_soon_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/home_screen.dart';
import '../screens/lessons_screen.dart';
import '../screens/main_shell.dart';
import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';
import '../screens/downloads_screen.dart';
import '../screens/splash_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child, currentLocation: state.matchedLocation),
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/search',
            name: 'search',
            builder: (context, state) => const SearchScreen(),
          ),
          GoRoute(
            path: '/favorites',
            name: 'favorites',
            builder: (context, state) => const FavoritesScreen(),
          ),
          GoRoute(
            path: '/downloads',
            name: 'downloads',
            builder: (context, state) => const DownloadsScreen(),
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/lessons',
        name: 'lessons',
        builder: (context, state) => const LessonsScreen(),
      ),
      GoRoute(
        path: '/audio-player',
        name: 'audio_player',
        builder: (context, state) => const AudioPlayerScreen(),
      ),
      GoRoute(
        path: '/coming-soon',
        name: 'coming_soon',
        builder: (context, state) => const ComingSoonScreen(),
      ),
    ],
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text('የገቢ ገጽ አልተገኘም'))),
  );
});
