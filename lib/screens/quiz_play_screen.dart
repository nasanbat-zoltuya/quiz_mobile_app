import 'package:flutter/material.dart';
import '../core/nav.dart';
import '../core/theme.dart';
import '../data/models.dart';
import '../widgets/app_widgets.dart';
import 'result_screen.dart';

class QuizPlayScreen extends StatefulWidget {
  final Quiz quiz;
  const QuizPlayScreen(this.quiz, {super.key});
  @override
  State<QuizPlayScreen> createState() => _QuizPlayScreenState();
}

class _QuizPlayScreenState extends State<QuizPlayScreen> {
  int index = 0;
  late final List<int?> answers = List.filled(total, null);

  int get total => widget.quiz.questions.length;

  void next() {
    if (answers[index] == null) {
      toast(context, 'Эхлээд хариултаа сонгоно уу');
    } else if (index < total - 1) {
      setState(() => index++);
    } else {
      confirmFinish();
    }
  }

  void confirmFinish() {
    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        title: const Text('🎉 Дуусгах уу? 🎉', textAlign: TextAlign.center),
        content: const Text(
            'Та хариултаа илгээх гэж байна. Бүх асуултад хариулсан эсэхээ шалгана уу.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13)),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(dialogCtx),
              child: const Text('Дахин харах')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: purple, foregroundColor: Colors.white),
            onPressed: () {
              Navigator.pop(dialogCtx);
              int correct = 0;
              for (int i = 0; i < total; i++) {
                if (answers[i] == widget.quiz.questions[i].answer) correct++;
              }
              goReplace(context, ResultScreen(correct, total));
            },
            child: const Text('Дуусгах'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.quiz.questions[index];
    return Scaffold(
      body: Column(children: [
        SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 8, 0),
            child: Column(children: [
              Row(children: [
                Text('Асуулт ${index + 1}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const Spacer(),
                IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context)),
              ]),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: LinearProgressIndicator(
                      value: (index + 1) / total,
                      minHeight: 6,
                      color: const Color(0xFF8BC34A),
                      backgroundColor: Colors.black12),
                ),
              ),
              const SizedBox(height: 6),
              Text('${index + 1}/$total асуулт',
                  style: const TextStyle(fontSize: 11, color: greyText)),
            ]),
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(q.text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600, height: 1.3)),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
          decoration: const BoxDecoration(color: purple, borderRadius: sheetRadius),
          child: SafeArea(
            top: false,
            child: Column(children: [
              const Text('Хариултаа сонгоно уу',
                  style: TextStyle(color: Colors.white, fontSize: 13)),
              const SizedBox(height: 12),
              for (int i = 0; i < q.options.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor:
                            answers[index] == i ? yellow : Colors.transparent,
                        foregroundColor:
                            answers[index] == i ? Colors.black87 : Colors.white,
                        side: BorderSide(
                            color: answers[index] == i ? yellow : Colors.white),
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () => setState(() => answers[index] = i),
                      child: Text(q.options[i]),
                    ),
                  ),
                ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back,
                          color: index == 0 ? Colors.white38 : Colors.white),
                      onPressed: index == 0 ? null : () => setState(() => index--),
                    ),
                    PrimaryButton(index == total - 1 ? 'Finish' : 'Next',
                        width: 120, bg: Colors.white, fg: purple, onTap: next),
                  ]),
            ]),
          ),
        ),
      ]),
    );
  }
}
