import 'package:flutter/material.dart';

// Дэлгэц хооронд шилжих товч функцууд

void go(BuildContext c, Widget page) =>
    Navigator.of(c).push(MaterialPageRoute(builder: (_) => page));

void goReplace(BuildContext c, Widget page) =>
    Navigator.of(c).pushReplacement(MaterialPageRoute(builder: (_) => page));

// Өмнөх бүх дэлгэцийг хаагаад шинээр эхлүүлнэ (Login, Logout-д хэрэглэнэ)
void goClear(BuildContext c, Widget page) => Navigator.of(c)
    .pushAndRemoveUntil(MaterialPageRoute(builder: (_) => page), (r) => false);

void toast(BuildContext c, String msg) =>
    ScaffoldMessenger.of(c).showSnackBar(SnackBar(content: Text(msg)));
