// lib/features/timer/presentation/screens/splash_screen.dart

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // 👈 Se usa para cargar el JSON
import 'package:javerage_timer/features/timer/presentation/screens/timer_screen.dart'; 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Espera la duración deseada de la animación (3 segundos)
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const TimerScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background, 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 👈 Lottie.asset() CARGA Y EJECUTA TU JSON
            Lottie.asset(
              'assets/lottie/timer_splash.json', // 👈 RUTA EXACTA DEL JSON
              width: 250,
              height: 250,
              repeat: true, // Mantener la animación corriendo durante los 3 segundos
            ),
            const SizedBox(height: 24),
            Text(
              'Javerage Timer Pro',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}