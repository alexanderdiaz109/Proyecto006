// lib/features/timer/presentation/widgets/timer_text.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:javerage_timer/features/timer/application/timer_bloc.dart'; 
import 'duration_input_dialog.dart';

class TimerText extends StatelessWidget {
  const TimerText({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.select((TimerBloc bloc) => bloc.state);
    final duration = state.duration;
    
    final progressValue = state.initialDuration > 0 
        ? duration / state.initialDuration 
        : 0.0;
    
    final minutesStr = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    
    // Define el color de la línea de progreso
    final lineColor = state is TimerInitial 
        ? Colors.grey.shade600 // 👈 Gris oscuro para Pausa
        : state is TimerFinished 
            ? Colors.red 
            : Theme.of(context).colorScheme.primary; // Azul/Principal para Corriendo

    return Stack(
      alignment: Alignment.center,
      children: [
        // INDICADOR CIRCULAR (GRÁFICA)
        SizedBox(
          width: 300, 
          height: 300,
          child: CircularProgressIndicator(
            value: progressValue, 
            strokeWidth: 10,
            backgroundColor: Colors.black54, 
            valueColor: AlwaysStoppedAnimation<Color>(lineColor), // 👈 Usa el color dinámico
          ),
        ),
        
        // TEXTO CLICKABLE (SET INTERVAL)
        GestureDetector(
          onTap: state is TimerInitial ? () async {
            final newDuration = await showDurationInputDialog(context); 
            
            if (newDuration != null) {
              if (!context.mounted) return;
              context.read<TimerBloc>().add(TimerStarted(duration: newDuration)); 
            }
          } : null,
          child: Text(
            '$minutesStr:$secondsStr',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  // El color del texto cambia a secundario (típicamente brillante) para la pausa
                  color: state is TimerInitial ? Theme.of(context).colorScheme.secondary : Colors.white,
                ),
          ),
        ),
      ],
    );
  }
}