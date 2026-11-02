import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/nav.dart';
import '../core/theme.dart';
import '../widgets/app_widgets.dart';

/// 4 оронтой OTP код оруулах дэлгэц. Баталгаажсаны дараа юу хийхийг
/// [onVerified] тодорхойлно (Login, Register, Утас солих гурвуулаа ашиглана).
class OtpScreen extends StatefulWidget {
  final String phone;
  final void Function(BuildContext) onVerified;
  const OtpScreen({super.key, required this.phone, required this.onVerified});
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final ctrls = List.generate(4, (_) => TextEditingController());
  final nodes = List.generate(4, (_) => FocusNode());
  int seconds = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer?.cancel();
    seconds = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds == 0) {
        t.cancel();
      } else {
        setState(() => seconds--);
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    for (final c in ctrls) {
      c.dispose();
    }
    for (final n in nodes) {
      n.dispose();
    }
    super.dispose();
  }

  void verify() {
    if (ctrls.any((c) => c.text.isEmpty)) {
      toast(context, '4 оронтой кодоо бүрэн оруулна уу');
      return;
    }
    widget.onVerified(context); // Загвар тул дурын код зөвшөөрнө
  }

  OutlineInputBorder _border(Color c, double w) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: w == 0 ? BorderSide.none : BorderSide(color: c, width: w),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('OTP')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('OTP код баталгаажуулах',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text('${widget.phone} дугаар руу илгээсэн кодыг оруулна уу',
                  style: const TextStyle(fontSize: 12, color: greyText)),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    4,
                    (i) => SizedBox(
                          width: 64,
                          height: 64,
                          child: TextField(
                            controller: ctrls[i],
                            focusNode: nodes[i],
                            autofocus: i == 0,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              counterText: '',
                              border: _border(Colors.transparent, 0),
                              focusedBorder: _border(purple, 1.5),
                            ),
                            onChanged: (v) {
                              if (v.isNotEmpty && i < 3) nodes[i + 1].requestFocus();
                              if (v.isEmpty && i > 0) nodes[i - 1].requestFocus();
                            },
                          ),
                        )),
              ),
              const SizedBox(height: 24),
              Center(
                child: seconds > 0
                    ? Text.rich(TextSpan(
                        text: 'Кодыг дахин илгээх: ',
                        style: const TextStyle(fontSize: 12),
                        children: [
                          TextSpan(
                              text: '00:${seconds.toString().padLeft(2, '0')}',
                              style: const TextStyle(
                                  color: purple, fontWeight: FontWeight.bold))
                        ]))
                    : TextButton(
                        onPressed: () {
                          setState(startTimer);
                          toast(context, 'Код дахин илгээгдлээ');
                        },
                        child: const Text('Кодыг дахин илгээх')),
              ),
              const SizedBox(height: 24),
              PrimaryButton('Verify', onTap: verify),
            ],
          ),
        ),
      );
}
