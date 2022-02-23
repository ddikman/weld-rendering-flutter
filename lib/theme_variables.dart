import 'package:flutter/cupertino.dart';

abstract class ThemeVars {
  static const pagePadding = 8.0;
  static const verticalItemPadding = 16.0;
  static const listItemPadding = 8.0;

  static const Radius borderRadius = Radius.circular(8.0);

  static final shadow = [
    BoxShadow(
        color: Color.fromARGB((0.24 * 256).toInt(), 0, 0, 0),
        offset: const Offset(0.0, 1.0),
        blurRadius: 2.0
    ),
  ];

  static TextStyle listHeader = const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
}