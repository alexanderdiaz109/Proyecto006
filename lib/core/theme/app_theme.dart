// lib/core/theme/app_theme.dart

import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark, 
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(72, 74, 126, 1),
          brightness: Brightness.dark,
          primary: const Color.fromRGBO(72, 136, 199, 1), // Azul principal (olas/línea de correr)
          secondary: Colors.yellow.shade600, // 👈 Color Secundario Brillante (para texto en pausa, botones, etc.)
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
          headlineLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        // 👈 ESTO ES CLAVE: Define el color de los FloatingActionButton para que se use el color del esquema
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromRGBO(72, 136, 199, 1), 
          foregroundColor: Colors.white,
        ),
      );
}