import 'package:flutter/material.dart';
import '../core/nav.dart';
import '../core/theme.dart';
import '../data/models.dart';
import '../data/sample_data.dart';
import '../screens/quiz_play_screen.dart';
import 'app_widgets.dart';

/// Ангиллын товчнуудын эгнээ
class CategoryBar extends StatelessWidget {
  final String? selected;
  final ValueChanged<String> onSelect;
  const CategoryBar({super.key, this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories
              .map((c) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Pill(c, selected == c, () => onSelect(c)),
                  ))
              .toList(),
        ),
      );
}

class QuizCard extends StatelessWidget {
  final Quiz quiz;
  const QuizCard(this.quiz, {super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => showQuizSheet(context, quiz),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: lightBlue,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x1A5B4BDE), blurRadius: 8, offset: Offset(0, 3))
            ],
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                child: SizedBox(
                    width: double.infinity, child: Img(quiz.image, radius: 12))),
            const SizedBox(height: 6),
            Text(quiz.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            Text('${quiz.questions.length} асуулт',
                style: const TextStyle(fontSize: 10, color: greyText)),
          ]),
        ),
      );
}

class RankTile extends StatelessWidget {
  final int rank;
  final Player player;
  const RankTile(this.rank, this.player, {super.key});

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: player.isYou ? lightBlue : greyBg,
            borderRadius: BorderRadius.circular(16)),
        child: Row(children: [
          CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('$rank',
                  style: const TextStyle(fontWeight: FontWeight.bold))),
          const SizedBox(width: 12),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(player.isYou ? '${player.name} (та)' : player.name,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Row(children: [
              const Icon(Icons.star, color: purple, size: 14),
              const SizedBox(width: 4),
              Text('${player.points} оноо', style: const TextStyle(fontSize: 12)),
            ]),
          ]),
        ]),
      );
}

/// Quiz дээр дарахад доороос гарч ирэх дэлгэрэнгүй цонх
void showQuizSheet(BuildContext context, Quiz quiz) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(borderRadius: sheetRadius),
    builder: (sheetCtx) => Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(sheetCtx))),
        Img(quiz.image, h: 170, w: double.infinity, radius: 16),
        const SizedBox(height: 12),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(quiz.title,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold))),
        const SizedBox(height: 4),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
                '${quiz.questions.length} асуулт  •  Нийт ${quiz.questions.length * 20} оноо',
                style: const TextStyle(fontSize: 12, color: greyText))),
        const SizedBox(height: 12),
        const Align(
            alignment: Alignment.centerLeft,
            child: Text(
                'Заавар:\n1. Асуулт бүрийг анхааралтай уншина уу.\n2. Зөв хариултыг сонгоно уу.\n3. Өндөр оноо авч Leaderboard-д өөд гараарай.',
                style: TextStyle(fontSize: 12, height: 1.5))),
        const SizedBox(height: 20),
        PrimaryButton('Quiz эхлэх', onTap: () {
          Navigator.pop(sheetCtx);
          go(context, QuizPlayScreen(quiz));
        }),
      ]),
    ),
  );
}
