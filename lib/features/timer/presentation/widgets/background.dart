// lib/features/timer/presentation/widgets/background.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:javerage_timer/features/timer/application/timer_bloc.dart';
import 'package:javerage_timer/features/timer/presentation/widgets/custom_waves.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    // 👈 Escucha el estado para cambiar el color de la ola
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        Color waveColor;
        
        if (state is TimerTicking) {
          // Color cuando está corriendo
          waveColor = const Color.fromRGBO(72, 74, 126, 1); 
        } else if (state is TimerFinished) {
          // Color cuando termina (Alarma/Notificación)
          waveColor = Colors.red; 
        } else {
          // Color por defecto (Inicial/Pausa)
          waveColor = const Color.fromRGBO(72, 136, 199, 1);
        }

        return CustomWaves(baseColor: waveColor);
      },
    );
  }
}