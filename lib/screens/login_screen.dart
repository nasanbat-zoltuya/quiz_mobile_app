import 'package:flutter/material.dart';
import '../core/nav.dart';
import '../core/theme.dart';
import '../widgets/app_widgets.dart';
import 'main_screen.dart';
import 'otp_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phone = TextEditingController();

  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }

  void login() {
    final number = phone.text.trim();
    if (number.length < 8) {
      toast(context, 'Утасны дугаараа зөв оруулна уу (8 орон)');
      return;
    }
    go(context,
        OtpScreen(phone: number, onVerified: (c) => goClear(c, const MainScreen())));
  }

  @override
  Widget build(BuildContext context) => PurplePage(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Center(child: Logo(size: 40)),
              const SizedBox(height: 110),
              const Text('Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              const Text('Дахин тавтай морил',
                  style: TextStyle(color: Colors.white70, fontSize: 13)),
              AppField('Утасны дугаар',
                  hint: 'Утасны дугаараа оруулна уу',
                  controller: phone,
                  keyboard: TextInputType.phone,
                  fill: Colors.white,
                  labelColor: Colors.white),
              const SizedBox(height: 20),
              PrimaryButton('Login',
                  bg: yellow, fg: Colors.black87, onTap: login),
              const SizedBox(height: 16),
              const Center(
                  child: Text('Эсвэл',
                      style: TextStyle(color: Colors.white70, fontSize: 12))),
              const SizedBox(height: 16),
              OutlinedPill('Google',
                  color: Colors.white,
                  onTap: () => goClear(context, const MainScreen())),
              const SizedBox(height: 12),
              Center(
                child: TextButton(
                  onPressed: () => go(context, const RegisterScreen()),
                  child: const Text('Бүртгэлгүй юу? Register',
                      style: TextStyle(color: yellow)),
                ),
              ),
            ],
          ),
        ),
      );
}
