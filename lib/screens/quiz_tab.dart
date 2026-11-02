import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../data/sample_data.dart';
import '../widgets/quiz_widgets.dart';
import '../widgets/app_widgets.dart';

/// Quiz жагсаалт: нэрээр хайх + ангиллаар шүүх
class QuizTab extends StatefulWidget {
  final String category;
  final ValueChanged<String> onCategory;
  const QuizTab({super.key, required this.category, required this.onCategory});
  @override
  State<QuizTab> createState() => _QuizTabState();
}

class _QuizTabState extends State<QuizTab> {
  final search = TextEditingController();

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = search.text.trim().toLowerCase();
    final filtered = quizzes
        .where((q) =>
            (widget.category == 'Бүгд' || q.category == widget.category) &&
            q.title.toLowerCase().contains(text))
        .toList();

    return Scaffold(
      backgroundColor: purple,
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: search,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Quiz хайх...',
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search, color: purple),
                suffixIcon: text.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => setState(search.clear)),
              ),
            ),
          ),
          Expanded(
            child: WhiteSheet(
              child: Column(children: [
                CategoryBar(
                    selected: widget.category, onSelect: widget.onCategory),
                const SizedBox(height: 12),
                Expanded(
                  child: filtered.isEmpty
                      ? const Center(
                          child: Text('Quiz олдсонгүй',
                              style: TextStyle(color: greyText)))
                      : GridView.builder(
                          padding: const EdgeInsets.only(bottom: 8),
                          itemCount: filtered.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 12,
                                  crossAxisSpacing: 12,
                                  childAspectRatio: 0.85),
                          itemBuilder: (_, i) => QuizCard(filtered[i]),
                        ),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
