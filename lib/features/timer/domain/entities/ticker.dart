// lib/features/timer/domain/entities/ticker.dart

/// The `Ticker` class in Dart provides a stream of integers that emit a value every second.
class Ticker {
  const Ticker();

  /// Emite un entero (tick) cada segundo.
  // 👈 CORRECCIÓN CLAVE: El método NO debe tener argumentos.
  Stream<int> tick() { 
    // Usamos 'x' como el índice del Stream.periodic.
    // (x) => x + 1 asegura que el primer tick es 1, el segundo es 2, y así sucesivamente.
    return Stream.periodic(const Duration(seconds: 1), (x) => x + 1); 
  }
}