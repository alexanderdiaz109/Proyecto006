import 'package:flutter/material.dart';
import 'package:javerage_timer/features/timer/presentation/widgets/actions_buttons.dart';
import 'package:javerage_timer/features/timer/presentation/widgets/background.dart';
import 'package:javerage_timer/features/timer/presentation/widgets/lap_list.dart';
import 'package:javerage_timer/features/timer/presentation/widgets/timer_text.dart';

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Javerage Timer'), backgroundColor: Colors.transparent),
      extendBodyBehindAppBar: true, // Para que el fondo llegue hasta el appBar
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isPortrait = constraints.maxHeight > constraints.maxWidth;
          final verticalPadding = isPortrait
              ? constraints.maxHeight * 0.1
              : constraints.maxHeight * 0.05;
              
          return Stack(
            children: [
              const Background(), // Olas dinámicas
              _TimerView(verticalPadding: verticalPadding),
            ],
          );
        },
      ),
    );
  }
}

class _TimerView extends StatelessWidget {
  const _TimerView({required this.verticalPadding});

  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: verticalPadding),
        // Espaciador para centrar el texto
        const Spacer(flex: 2), 
        const Center(child: TimerText()),
        const Spacer(flex: 1),
        const ActionButtons(),
        const SizedBox(height: 20),
        // La lista de laps ocupa el espacio restante y es scrollable
        const Expanded(child: LapList()),
      ],
    );
  }
}