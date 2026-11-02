import 'package:flutter/material.dart';
import '../core/nav.dart';
import '../core/theme.dart';
import '../widgets/app_widgets.dart';
import 'main_screen.dart';

class ResultScreen extends StatelessWidget {
  final int correct, total;
  const ResultScreen(this.correct, this.total, {super.key});

  @override
  Widget build(BuildContext context) => PurplePage(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(children: [
            const Spacer(),
            const Text('🎉', style: TextStyle(fontSize: 80)),
            const SizedBox(height: 12),
            const Text('Quiz дууслаа!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: lightBlue, borderRadius: BorderRadius.circular(16)),
              child: Column(children: [
                const Text('Таны үр дүн',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  StatChip(Icons.star, purple, '${correct * 20} оноо'),
                  const SizedBox(width: 12),
                  StatChip(Icons.check_circle, Colors.green, '$correct/$total зөв'),
                ]),
              ]),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => goClear(context, const MainScreen(startIndex: 2)),
              child: const Text('Leaderboard харах',
                  style: TextStyle(color: Colors.white)),
            ),
            const Spacer(),
            PrimaryButton('Өөр Quiz үзэх',
                bg: Colors.white,
                fg: purple,
                onTap: () => goClear(context, const MainScreen(startIndex: 1))),
          ]),
        ),
      );
}
