// lib/features/timer/presentation/screens/timer_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:javerage_timer/features/timer/application/timer_bloc.dart';
import 'package:javerage_timer/features/timer/data/repositories/timer_repository_impl.dart';
import 'package:javerage_timer/features/timer/domain/entities/ticker.dart';
import 'package:javerage_timer/features/timer/presentation/widgets/timer_view.dart';
import 'package:audioplayers/audioplayers.dart'; 

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(timerRepository: const TimerRepositoryImpl(Ticker())), 
      child: const TimerScreenWithListener(),
    );
  }
}

/// Maneja la reproducción y detención del sonido
class TimerScreenWithListener extends StatefulWidget { 
  const TimerScreenWithListener({super.key});

  @override
  State<TimerScreenWithListener> createState() => _TimerScreenWithListenerState();
}

class _TimerScreenWithListenerState extends State<TimerScreenWithListener> {
  final AudioPlayer player = AudioPlayer(); // Referencia persistente

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TimerBloc, TimerState>(
      listener: (context, state) async {
        if (state is TimerFinished) {
          await player.play(AssetSource('audio/alarm.mp3'));
        } 
        
        // DETENER SONIDO AL PAUSAR O RESETEAR
        if (state is TimerInitial) { 
          await player.stop(); 
        }
      },
      child: const TimerView(),
    );
  }
}