// lib/features/timer/application/timer_state.dart

part of 'timer_bloc.dart';

sealed class TimerState extends Equatable {
  // 👈 CORRECCIÓN CLAVE: Define initialDuration en el constructor y como propiedad
  const TimerState(this.duration, {required this.initialDuration, this.lapTimes = const []});
  final int duration;
  final int initialDuration; // Duración original o de inicio
  final List<int> lapTimes; 

  @override
  List<Object> get props => [duration, lapTimes, initialDuration];
}

class TimerInitial extends TimerState {
  // Pasa initialDuration al constructor base (super)
  const TimerInitial(super.duration, {required super.initialDuration, super.lapTimes});

  @override
  String toString() => 'TimerInitial { duration: $duration, initialDuration: $initialDuration }';
}

class TimerTicking extends TimerState {
  // Pasa initialDuration al constructor base (super)
  const TimerTicking(super.duration, {required super.initialDuration, super.lapTimes});

  @override
  String toString() => 'TimerTicking { duration: $duration, initialDuration: $initialDuration }';
}

class TimerFinished extends TimerState {
  // Usa la propiedad estática _duration de TimerBloc, por lo que debe estar definida allí
  const TimerFinished() : super(0, initialDuration: TimerBloc._duration, lapTimes: const []); 
}