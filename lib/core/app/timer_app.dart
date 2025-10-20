// lib/core/app/timer_app.dart

import 'package:flutter/material.dart';
import 'package:javerage_timer/core/theme/app_theme.dart';
import 'package:javerage_timer/features/timer/presentation/screens/splash_screen.dart'; // 👈 Importa el nuevo splash

class TimerApp extends StatelessWidget {
  const TimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Javerage Timer',
      theme: AppTheme().getTheme(),
      home: const SplashScreen(), // 👈 INICIA CON EL SPLASH
    );
  }
}