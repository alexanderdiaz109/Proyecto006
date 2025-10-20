// lib/features/timer/presentation/widgets/custom_waves.dart

import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class CustomWaves extends StatelessWidget {
  const CustomWaves({super.key, required this.baseColor});

  final Color baseColor;

  // Función de ayuda para la opacidad
  Color _colorWithOpacity(double opacity) {
    return baseColor.withAlpha((255 * opacity).round()); 
  }

  @override
  Widget build(BuildContext context) {
    return WaveWidget(
      config: CustomConfig(
        gradients: [
          [baseColor, baseColor],
          [_colorWithOpacity(0.8), _colorWithOpacity(0.8)],
          [_colorWithOpacity(0.6), _colorWithOpacity(0.6)],
          [_colorWithOpacity(0.4), _colorWithOpacity(0.4)],
        ],
        durations: const [30000, 21000, 18000, 50000],
        heightPercentages: const [0.30, 0.28, 0.30, 0.26],
        blur: const MaskFilter.blur(BlurStyle.solid, 10),
        gradientBegin: Alignment.bottomLeft,
        gradientEnd: Alignment.topRight,
      ),
      waveAmplitude: 35,
      size: const Size(double.infinity, double.infinity),
    );
  }
}