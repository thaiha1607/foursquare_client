import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'routes/homepage.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Homepage(),
    ),
  ],
);

void main() {
  runApp(ProviderScope(
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Foursquare App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      routerConfig: _router,
    );
  }
}
