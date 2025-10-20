// lib/features/timer/application/timer_event.dart

part of 'timer_bloc.dart';

sealed class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class TimerStarted extends TimerEvent {
  // Usado para iniciar/reiniciar con una nueva duración (set interval)
  const TimerStarted({required this.duration});
  final int duration;
}

class TimerTicked extends TimerEvent {
  const TimerTicked({required this.duration});
  final int duration;

  @override
  List<Object> get props => [duration];
}

class TimerPaused extends TimerEvent {
  const TimerPaused();
}

class TimerReset extends TimerEvent {
  const TimerReset();
}

// 👈 NUEVO EVENTO PARA LAPS
class TimerLapPressed extends TimerEvent {
  const TimerLapPressed();
}
// 👈 NUEVO EVENTO PARA AÑADIR TIEMPO
class TimerExtended extends TimerEvent {
  const TimerExtended({required this.secondsToAdd});
  final int secondsToAdd;
}