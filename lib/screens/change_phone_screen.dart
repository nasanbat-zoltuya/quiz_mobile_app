import 'package:flutter/material.dart';
import '../core/nav.dart';
import '../core/theme.dart';
import '../data/sample_data.dart';
import '../widgets/app_widgets.dart';
import 'otp_screen.dart';

/// 1-р алхам: OTP илгээх
class ChangePhoneScreen extends StatelessWidget {
  const ChangePhoneScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Утасны дугаар солих')),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(Icons.phone_in_talk, size: 100, color: purple),
            const SizedBox(height: 16),
            const Text('Утасны дугаар солих',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Дугаараа солихын тулд баталгаажуулах OTP код илгээнэ.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: greyText)),
            const SizedBox(height: 24),
            PrimaryButton('OTP илгээх',
                width: 200,
                onTap: () => go(
                    context,
                    OtpScreen(
                        phone: userPhone,
                        onVerified: (c) => goReplace(c, const NewPhoneScreen())))),
          ]),
        ),
      );
}

/// 2-р алхам: шинэ дугаар оруулах
class NewPhoneScreen extends StatefulWidget {
  const NewPhoneScreen({super.key});
  @override
  State<NewPhoneScreen> createState() => _NewPhoneScreenState();
}

class _NewPhoneScreenState extends State<NewPhoneScreen> {
  final phone = TextEditingController();

  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Шинэ дугаар')),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Шинэ утасны дугаар',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            AppField('Шинэ дугаар',
                hint: 'Шинэ дугаараа оруулна уу',
                controller: phone,
                keyboard: TextInputType.phone),
            const SizedBox(height: 24),
            PrimaryButton('Дугаар шинэчлэх', onTap: () {
              if (phone.text.trim().length < 8) {
                toast(context, 'Дугаараа зөв оруулна уу');
                return;
              }
              toast(context, 'Утасны дугаар шинэчлэгдлээ');
              Navigator.of(context).popUntil((r) => r.isFirst);
            }),
          ]),
        ),
      );
}
