import 'package:flutter/material.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/home_view.dart';

void main() {
  runApp(SmileSimulation());
}

class SmileSimulation extends StatelessWidget {
  const SmileSimulation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
    );
  } 
}
