import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../data/models.dart';
import '../data/sample_data.dart';
import '../widgets/app_widgets.dart';
import '../widgets/quiz_widgets.dart';

class RankTab extends StatelessWidget {
  const RankTab({super.key});

  Widget _podium(Player p, int place, double height, Color color) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 84,
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(8)),
            child: Text(p.name,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 4),
          Container(
            width: 84,
            height: height,
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 8),
            color: color.withAlpha(150),
            child: Text('$place',
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: purple,
        body: SafeArea(
          bottom: false,
          child: Column(children: [
            const SizedBox(height: 16),
            const Text('Leaderboard',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _podium(leaderboard[1], 2, 90, const Color(0xFF9FD0F7)),
                  const SizedBox(width: 4),
                  _podium(leaderboard[0], 1, 130, const Color(0xFFF8C9A3)),
                  const SizedBox(width: 4),
                  _podium(leaderboard[2], 3, 65, const Color(0xFFB7E27A)),
                ]),
            Expanded(
              child: WhiteSheet(
                child: ListView(padding: EdgeInsets.zero, children: [
                  for (int i = 0; i < leaderboard.length; i++)
                    RankTile(i + 1, leaderboard[i]),
                ]),
              ),
            ),
          ]),
        ),
      );
}
