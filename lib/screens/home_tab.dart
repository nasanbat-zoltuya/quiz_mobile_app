import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../data/sample_data.dart';
import '../widgets/app_widgets.dart';
import '../widgets/quiz_widgets.dart';

class HomeTab extends StatelessWidget {
  final ValueChanged<String> onCategory;
  final VoidCallback onSearch, onSeeRank;
  const HomeTab(
      {super.key,
      required this.onCategory,
      required this.onSearch,
      required this.onSeeRank});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: purple,
        body: SafeArea(
          bottom: false,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(children: [
                const Logo(size: 26),
                const Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                      icon: const Icon(Icons.search, color: purple),
                      onPressed: onSearch),
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: lightBlue, borderRadius: BorderRadius.circular(16)),
              child: Column(children: [
                const Text('Сайн уу, $userName 👋',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  StatChip(Icons.star, purple, '$userPoints оноо'),
                  SizedBox(width: 12),
                  StatChip(Icons.bar_chart, Colors.pink, 'Rank $userRank'),
                ]),
              ]),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: WhiteSheet(
                child: ListView(padding: EdgeInsets.zero, children: [
                  const SectionTitle('Ангилал'),
                  const SizedBox(height: 8),
                  CategoryBar(onSelect: onCategory),
                  const SizedBox(height: 20),
                  const SectionTitle('🔥 Алдартай Quiz'),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 175,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (_, i) =>
                          SizedBox(width: 140, child: QuizCard(quizzes[i])),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SectionTitle('🏆 Top 3',
                      trailing: TextButton(
                          onPressed: onSeeRank,
                          child: const Text('Бүгдийг харах'))),
                  for (int i = 0; i < 3; i++) RankTile(i + 1, leaderboard[i]),
                ]),
              ),
            ),
          ]),
        ),
      );
}
