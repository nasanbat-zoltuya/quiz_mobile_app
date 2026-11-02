import 'package:flutter/material.dart';
import '../core/theme.dart';

// ============================================================
//  Бүх дэлгэцэд давтагдах жижиг бүрэлдэхүүн хэсгүүд
// ============================================================

/// assets/images/ доторх зураг. Файл олдохгүй бол саарал орлуулагч харуулна.
class Img extends StatelessWidget {
  final String name;
  final double? w, h;
  final BoxFit fit;
  final double radius;
  const Img(this.name,
      {super.key, this.w, this.h, this.fit = BoxFit.cover, this.radius = 0});

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.asset(
          'assets/images/$name',
          width: w,
          height: h,
          fit: fit,
          errorBuilder: (_, __, ___) => Container(
            width: w,
            height: h,
            color: lightBlue,
            alignment: Alignment.center,
            child: const Icon(Icons.image, color: purple, size: 36),
          ),
        ),
      );
}

class Logo extends StatelessWidget {
  final double size;
  const Logo({super.key, this.size = 30});

  @override
  Widget build(BuildContext context) => Text('QUIZONE',
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w900,
        color: yellow,
        letterSpacing: 1,
        shadows: const [Shadow(color: Colors.black38, offset: Offset(2, 2))],
      ));
}

/// Нэг өнгийн том товч
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color bg, fg;
  final double? width;
  const PrimaryButton(this.text,
      {super.key,
      required this.onTap,
      this.bg = purple,
      this.fg = Colors.white,
      this.width});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width ?? double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bg,
            foregroundColor: fg,
            elevation: 0,
            shape: const StadiumBorder(),
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: onTap,
          child: Text(text),
        ),
      );
}

/// Хүрээтэй товч (Google, Logout гэх мэт)
class OutlinedPill extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  const OutlinedPill(this.text,
      {super.key, required this.onTap, this.color = purple});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        height: 48,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              foregroundColor: color,
              side: BorderSide(color: color),
              shape: const StadiumBorder()),
          onPressed: onTap,
          child: Text(text),
        ),
      );
}

/// Ангиллын жижиг товч
class Pill extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;
  const Pill(this.text, this.selected, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              color: selected ? purple : lightBlue,
              borderRadius: BorderRadius.circular(20)),
          child: Text(text,
              style: TextStyle(
                  fontSize: 12,
                  color: selected ? Colors.white : purple,
                  fontWeight: FontWeight.w600)),
        ),
      );
}

/// Оноо, Rank харуулдаг цагаан хайрцаг
class StatChip extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  const StatChip(this.icon, this.color, this.text, {super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 6),
          Text(text,
              style:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        ]),
      );
}

/// Гарчигтай оруулах талбар. Загвар нь theme.dart-аас автоматаар орно.
class AppField extends StatelessWidget {
  final String label, hint;
  final TextEditingController? controller;
  final TextInputType? keyboard;
  final bool enabled;
  final Color? fill;
  final Color labelColor;
  const AppField(this.label,
      {super.key,
      required this.hint,
      this.controller,
      this.keyboard,
      this.enabled = true,
      this.fill,
      this.labelColor = Colors.black});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 6),
            child: Text(label,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: labelColor)),
          ),
          TextField(
            controller: controller,
            keyboardType: keyboard,
            enabled: enabled,
            decoration: InputDecoration(hintText: hint, fillColor: fill),
          ),
        ],
      );
}

class SectionTitle extends StatelessWidget {
  final String text;
  final Widget? trailing;
  const SectionTitle(this.text, {super.key, this.trailing});

  @override
  Widget build(BuildContext context) => Row(children: [
        Text(text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const Spacer(),
        if (trailing != null) trailing!,
      ]);
}

/// Нүүр, Quiz, Rank, Profile дэлгэцийн цагаан самбар
class WhiteSheet extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  const WhiteSheet(
      {super.key, required this.child, this.padding = const EdgeInsets.all(16)});

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: padding,
        decoration:
            const BoxDecoration(color: Colors.white, borderRadius: sheetRadius),
        child: child,
      );
}

/// Ягаан дэвсгэртэй дэлгэц (чимэглэлийн дугуйтай)
class PurplePage extends StatelessWidget {
  final Widget child;
  const PurplePage({super.key, required this.child});

  static Widget _circle(double size) => Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color(0x14FFFFFF)),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: purple,
        body: Stack(children: [
          Positioned(top: -70, right: -70, child: _circle(220)),
          Positioned(bottom: -90, left: -80, child: _circle(260)),
          SafeArea(child: child),
        ]),
      );
}
