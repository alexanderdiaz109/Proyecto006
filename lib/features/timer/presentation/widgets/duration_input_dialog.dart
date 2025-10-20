// lib/features/timer/presentation/widgets/duration_input_dialog.dart

import 'package:flutter/material.dart';

/// Muestra un diálogo para que el usuario ingrese la duración en minutos.
/// Retorna la duración en segundos (int) o null.
Future<int?> showDurationInputDialog(BuildContext context) async {
  final controller = TextEditingController();
  
  return showDialog<int>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Establecer Duración (Minutos)'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Minutos',
            hintText: 'Ej: 5',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), // Cancelar
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              final minutes = int.tryParse(controller.text);
              if (minutes != null && minutes > 0) {
                // Retorna la duración en segundos
                Navigator.of(context).pop(minutes * 60); 
              } else {
                Navigator.of(context).pop(null); // Valor inválido
              }
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}