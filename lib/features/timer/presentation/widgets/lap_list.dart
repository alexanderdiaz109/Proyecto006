// lib/features/timer/presentation/widgets/lap_list.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:javerage_timer/features/timer/application/timer_bloc.dart';

/// Formatea segundos a MM:SS
String _formatDuration(int duration) {
  final minutesStr = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
  final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
  return '$minutesStr:$secondsStr';
}

class LapList extends StatelessWidget {
  const LapList({super.key});

  @override
  Widget build(BuildContext context) {
    // Escucha solo la lista de lapTimes para evitar reconstrucciones innecesarias
    final lapTimes = context.select((TimerBloc bloc) => bloc.state.lapTimes);

    if (lapTimes.isEmpty) {
      return const SizedBox.shrink();
    }

    return Expanded(
      child: ListView.builder(
        reverse: false, // Muestra el lap más viejo primero
        itemCount: lapTimes.length,
        itemBuilder: (context, index) {
          final lapTime = lapTimes[index];
          // Usamos el índice de forma descendente para mostrar Lap 1, Lap 2, etc.
          final lapNumber = lapTimes.length - index; 

          return ListTile(
            leading: Text(
              'Vuelta $lapNumber', 
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: Text(
              _formatDuration(lapTime),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        },
      ),
    );
  }
}