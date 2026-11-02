import 'package:flutter/material.dart';
import '../core/nav.dart';
import '../core/theme.dart';
import '../widgets/app_widgets.dart';
import 'onboarding_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) => PurplePage(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text('Тавтай морил',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600)),
              const Logo(size: 46),
              const SizedBox(height: 20),
              const Text(
                  'Мэдлэгээ шалгаж, шинэ зүйл сураад Leaderboard-ийн тэргүүнд гараарай. Сорилтод бэлэн үү?',
                  style: TextStyle(
                      color: Colors.white70, fontSize: 15, height: 1.5)),
              const Spacer(),
              PrimaryButton('Эхлэх',
                  bg: yellow,
                  fg: Colors.black87,
                  onTap: () => go(context, const OnboardingScreen())),
            ],
          ),
        ),
      );
}
