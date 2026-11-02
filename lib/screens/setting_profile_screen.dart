import 'package:flutter/material.dart';
import '../core/nav.dart';
import '../data/sample_data.dart';
import '../widgets/app_widgets.dart';

class SettingProfileScreen extends StatefulWidget {
  const SettingProfileScreen({super.key});
  @override
  State<SettingProfileScreen> createState() => _SettingProfileScreenState();
}

class _SettingProfileScreenState extends State<SettingProfileScreen> {
  final name = TextEditingController(text: userName);
  final phone = TextEditingController(text: userPhone);
  final email = TextEditingController(text: userEmail);

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Profile засах')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              ClipOval(child: Img('avatar.png', w: 56, h: 56)),
              const SizedBox(width: 12),
              TextButton.icon(
                onPressed: () => toast(context, 'Зураг солих боломж удахгүй нэмэгдэнэ'),
                icon: const Icon(Icons.camera_alt, size: 16),
                label: const Text('Зураг солих'),
              ),
            ]),
            AppField('Бүтэн нэр', hint: 'Нэр', controller: name),
            AppField('Утасны дугаар',
                hint: 'Утас', controller: phone, enabled: false),
            AppField('Email', hint: 'Email', controller: email),
            const SizedBox(height: 32),
            PrimaryButton('Хадгалах', onTap: () {
              toast(context, 'Profile шинэчлэгдлээ');
              Navigator.pop(context);
            }),
          ]),
        ),
      );
}
