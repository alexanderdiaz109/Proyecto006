// lib/features/timer/domain/repositories/timer_repository.dart

/// The `TimerRepository` class in Dart provides a stream of integer values representing time ticks.
abstract class TimerRepository {
  // 👈 CORRECCIÓN CLAVE: El método debe ser 'ticker()' para coincidir con la llamada en el BLoC
  Stream<int> ticker();
}