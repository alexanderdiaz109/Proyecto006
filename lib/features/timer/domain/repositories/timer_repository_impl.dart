// lib/features/timer/data/repositories/timer_repository_impl.dart

import 'package:javerage_timer/features/timer/domain/repositories/timer_repository.dart';
import 'package:javerage_timer/features/timer/domain/entities/ticker.dart';

// lib/features/timer/domain/repositories/timer_repository.dart

/// The `TimerRepository` class in Dart provides a stream of integer values representing time ticks.
abstract class TimerRepository {
  // 👈 CORRECCIÓN CLAVE: El contrato solo espera 'ticker()' sin argumentos.
  Stream<int> ticker(); 
}