// lib/features/timer/presentation/widgets/action_buttons.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:javerage_timer/features/timer/application/timer_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (state is TimerInitial) ...[
              FloatingActionButton(
                heroTag: 'start',
                onPressed: () => context
                    .read<TimerBloc>()
                    .add(TimerStarted(duration: state.duration)),
                child: const Icon(Icons.play_arrow),
              ),
            ],
            if (state is TimerTicking) ...[
              FloatingActionButton(
                heroTag: 'pause',
                onPressed: () => context.read<TimerBloc>().add(const TimerPaused()),
                child: const Icon(Icons.pause),
              ),
              FloatingActionButton(
                heroTag: 'lap',
                onPressed: () =>
                    context.read<TimerBloc>().add(const TimerLapPressed()),
                child: const Icon(Icons.flag),
              ),
            ],
            if (state is TimerPaused) ...[
              FloatingActionButton(
                heroTag: 'resume',
                onPressed: () => context
                    .read<TimerBloc>()
                    .add(TimerStarted(duration: state.duration)),
                child: const Icon(Icons.play_arrow),
              ),
              FloatingActionButton(
                heroTag: 'reset',
                onPressed: () => context.read<TimerBloc>().add(const TimerReset()),
                child: const Icon(Icons.replay),
              ),
            ],
            if (state is TimerFinished) ...[
              FloatingActionButton(
                heroTag: 'reset',
                onPressed: () => context.read<TimerBloc>().add(const TimerReset()),
                child: const Icon(Icons.replay),
              ),
            ]
          ],
        );
      },
    );
  }
}
