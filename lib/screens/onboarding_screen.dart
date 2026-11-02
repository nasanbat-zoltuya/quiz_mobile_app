import 'package:flutter/material.dart';
import '../core/nav.dart';
import '../core/theme.dart';
import '../widgets/app_widgets.dart';
import 'login_screen.dart';


const _pages = [
  [
    'onboard1.png',
    'Quiz-ийн ангиллуудыг судал',
    'Шинжлэх ухаанаас - Сонирхолтой хүртэл дуртай сэдвээ сонгоод мэдлэгээ шалга.'
  ],
  [
    'onboard2.png',
    'Хурдан, зөв хариул',
    'Хурдан бөгөөд үнэн зөв хариулах тусам оноо өндөр болно.'
  ],
  [
    'onboard3.png',
    'Leaderboard-д өөд тэмц',
    'Бусадтай өөрийгөө харьцуул. Энэ долоо хоногийн аварга чи байх болов уу?'
  ],
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final ctrl = PageController();
  int page = 0;

  bool get isLast => page == _pages.length - 1;

  void slide(bool forward) {
    final fn = forward ? ctrl.nextPage : ctrl.previousPage;
    fn(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(children: [
            Expanded(
              child: PageView.builder(
                controller: ctrl,
                itemCount: _pages.length,
                onPageChanged: (i) => setState(() => page = i),
                itemBuilder: (_, i) => Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Img(_pages[i][0], h: 260, fit: BoxFit.contain),
                        const SizedBox(height: 32),
                        Text(_pages[i][1],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        Text(_pages[i][2],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 14, color: greyText, height: 1.5)),
                      ]),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  _pages.length,
                  (i) => AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: page == i ? 24 : 10,
                        height: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: page == i ? yellow : Colors.grey.shade300),
                      )),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back,
                          color: page == 0 ? Colors.grey : Colors.black),
                      onPressed: page == 0 ? null : () => slide(false),
                    ),
                    PrimaryButton(
                      isLast ? 'Login' : 'Дараах',
                      width: 120,
                      onTap: () => isLast
                          ? go(context, const LoginScreen())
                          : slide(true),
                    ),
                  ]),
            ),
          ]),
        ),
      );
}
