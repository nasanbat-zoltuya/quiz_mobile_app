import 'package:flutter/material.dart';
import '../core/nav.dart';
import '../core/theme.dart';
import '../data/sample_data.dart';
import '../widgets/app_widgets.dart';
import 'change_phone_screen.dart';
import 'email_verify_screen.dart';
import 'login_screen.dart';
import 'setting_profile_screen.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  Widget _item(BuildContext c, IconData icon, String text, Widget page) =>
      ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: purple),
        title: Text(text, style: const TextStyle(fontSize: 13)),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => go(c, page),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: purple,
        body: SafeArea(
          bottom: false,
          child: Column(children: [
            const SizedBox(height: 16),
            ClipOval(child: Img('avatar.png', w: 80, h: 80)),
            const SizedBox(height: 8),
            const Text(userName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              StatChip(Icons.star, purple, '$userPoints оноо'),
              SizedBox(width: 12),
              StatChip(Icons.bar_chart, Colors.pink, 'Rank $userRank'),
            ]),
            const SizedBox(height: 16),
            Expanded(
              child: WhiteSheet(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionTitle('Profile мэдээлэл'),
                    const SizedBox(height: 8),
                    _item(context, Icons.person_outline, 'Profile засах',
                        const SettingProfileScreen()),
                    _item(context, Icons.phone_outlined, 'Утасны дугаар солих',
                        const ChangePhoneScreen()),
                    _item(context, Icons.email_outlined, 'Email баталгаажуулах',
                        const EmailVerifyScreen()),
                    const SizedBox(height: 16),
                    OutlinedPill('Logout',
                        onTap: () => goClear(context, const LoginScreen())),
                  ],
                ),
              ),
            ),
          ]),
        ),
      );
}
