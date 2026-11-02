import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'screens/welcome_screen.dart';

void main() => runApp(const QuizoneApp());

class QuizoneApp extends StatelessWidget {
  const QuizoneApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quizone',
        theme: buildTheme(),
        home: const WelcomeScreen(),
      );
}
