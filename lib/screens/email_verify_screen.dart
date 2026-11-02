import 'package:flutter/material.dart';
import '../core/nav.dart';
import '../core/theme.dart';
import '../data/sample_data.dart';
import '../widgets/app_widgets.dart';

class EmailVerifyScreen extends StatelessWidget {
  const EmailVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Email баталгаажуулах')),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(Icons.mark_email_unread, size: 100, color: purple),
            const SizedBox(height: 16),
            const Text('Email-ээ баталгаажуулна уу',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('$userEmail хаяг руу баталгаажуулах холбоос илгээнэ.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: greyText)),
            const SizedBox(height: 24),
            PrimaryButton('Email илгээх',
                width: 200, onTap: () => toast(context, 'Email илгээгдлээ')),
          ]),
        ),
      );
}
