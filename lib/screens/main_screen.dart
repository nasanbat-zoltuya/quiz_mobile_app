import 'package:flutter/material.dart';
import 'home_tab.dart';
import 'profile_tab.dart';
import 'quiz_tab.dart';
import 'rank_tab.dart';

/// Доод цэстэй үндсэн дэлгэц: Home / Quiz / Rank / Profile
class MainScreen extends StatefulWidget {
  final int startIndex;
  const MainScreen({super.key, this.startIndex = 0});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int index = widget.startIndex;
  String category = 'Бүгд'; // Home-оос сонгосон ангиллыг Quiz хэсэгт дамжуулна

  @override
  Widget build(BuildContext context) => Scaffold(
        body: IndexedStack(index: index, children: [
          HomeTab(
            onCategory: (c) => setState(() {
              category = c;
              index = 1;
            }),
            onSearch: () => setState(() => index = 1),
            onSeeRank: () => setState(() => index = 2),
          ),
          QuizTab(
              category: category,
              onCategory: (c) => setState(() => category = c)),
          const RankTab(),
          const ProfileTab(),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (i) => setState(() => index = i),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Quiz'),
            BottomNavigationBarItem(
                icon: Icon(Icons.leaderboard), label: 'Rank'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      );
}
