import 'package:flutter/material.dart';
import '../core/nav.dart';
import '../widgets/app_widgets.dart';
import 'main_screen.dart';
import 'otp_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    email.dispose();
    super.dispose();
  }

  void register() {
    if (name.text.trim().isEmpty ||
        phone.text.trim().length < 8 ||
        !email.text.contains('@')) {
      toast(context, 'Бүх талбарыг зөв бөглөнө үү');
      return;
    }
    go(
        context,
        OtpScreen(
            phone: phone.text.trim(),
            onVerified: (c) => goClear(c, const MainScreen())));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Register')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Эхлэцгээе',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 2),
              const Text('Үндсэн мэдээллээ оруулна уу',
                  style: TextStyle(fontSize: 12, color: Colors.black54)),
              AppField('Бүтэн нэр', hint: 'Нэрээ оруулна уу', controller: name),
              AppField('Утасны дугаар',
                  hint: 'Утасны дугаараа оруулна уу',
                  controller: phone,
                  keyboard: TextInputType.phone),
              AppField('Email',
                  hint: 'Email хаягаа оруулна уу',
                  controller: email,
                  keyboard: TextInputType.emailAddress),
              const SizedBox(height: 32),
              PrimaryButton('Register', onTap: register),
            ],
          ),
        ),
      );
}
