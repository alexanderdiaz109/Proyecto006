// lib/features/timer/data/repositories/timer_repository_impl.dart

import 'package:javerage_timer/features/timer/domain/repositories/timer_repository.dart';
import 'package:javerage_timer/features/timer/domain/entities/ticker.dart';

/// The `TimerRepositoryImpl` class implements the `TimerRepository` interface and provides a stream of
/// ticks using a `Ticker` instance.
class TimerRepositoryImpl implements TimerRepository {
  // Se requiere 'const' para el constructor
  const TimerRepositoryImpl(this._ticker); 

  final Ticker _ticker;

  // 👈 CORRECCIÓN CLAVE: Implementar el método 'ticker()'
  @override 
  Stream<int> ticker() => _ticker.tick(); // Llama al método tick() de la entidad Ticker
}