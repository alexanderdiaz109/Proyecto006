// lib/features/timer/application/timer_bloc.dart

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:javerage_timer/features/timer/domain/repositories/timer_repository.dart'; 

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc({required TimerRepository timerRepository})
      : _timerRepository = timerRepository,
        // Pasa initialDuration al estado inicial
        super(const TimerInitial(_duration, initialDuration: _duration)) { 
    on<TimerStarted>(_onStarted);
    on<TimerTicked>(_onTicked);
    on<TimerPaused>(_onPaused);
    on<TimerReset>(_onReset);
    on<TimerLapPressed>(_onLapPressed);
    on<TimerExtended>(_onExtended); // Manejador de extensión
  }

  final TimerRepository _timerRepository;
  static const int _duration = 60; 

  StreamSubscription<int>? _tickerSubscription;

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    // Al reanudar, usa la duración del evento (tiempo pausado)
    emit(TimerTicking(event.duration, initialDuration: state.initialDuration, lapTimes: state.lapTimes)); 
    _tickerSubscription?.cancel();
    
    _tickerSubscription = _timerRepository.ticker().listen( 
          // Resta y asegura el tipo int
          (ticks) => add(TimerTicked(duration: (event.duration - ticks).round())),
        );
  }

  void _onTicked(TimerTicked event, Emitter<TimerState> emit) {
    emit(
      event.duration > 0
          // Mantiene initialDuration
          ? TimerTicking(event.duration, initialDuration: state.initialDuration, lapTimes: state.lapTimes) 
          : const TimerFinished(),
    );
  }

  void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
    if (state is TimerTicking) {
      _tickerSubscription?.pause();
      // Pasa la duración actual y initialDuration al estado Initial (PAUSA)
      emit(TimerInitial(state.duration, initialDuration: state.initialDuration, lapTimes: state.lapTimes)); 
    }
  }

  void _onReset(TimerReset event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();
    // Resetear con initialDuration por defecto
    emit(const TimerInitial(_duration, initialDuration: _duration));
  }

  void _onLapPressed(TimerLapPressed event, Emitter<TimerState> emit) {
    if (state is! TimerTicking) return;
    
    final currentLapDuration = state.duration;
    final newLapTimes = [currentLapDuration, ...state.lapTimes]; 
    
    emit(TimerTicking(state.duration, initialDuration: state.initialDuration, lapTimes: newLapTimes));
  }
  
  void _onExtended(TimerExtended event, Emitter<TimerState> emit) {
    if (state is! TimerTicking) return;
    
    final newDuration = state.duration + event.secondsToAdd;
    
    // Mantiene initialDuration
    emit(TimerTicking(newDuration, initialDuration: state.initialDuration, lapTimes: state.lapTimes));
  }
}