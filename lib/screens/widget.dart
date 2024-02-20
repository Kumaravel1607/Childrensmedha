import 'package:flutter/material.dart';

text14(String text, Color color) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 12,
      color: color,
      fontWeight: FontWeight.w500,
    ),
  );
}

text16(String text, Color color) {
  return Text(
    text,
    style: TextStyle(fontSize: 14, color: color, fontWeight: FontWeight.w600),
  );
}

text20(String text, Color color) {
  return Text(
    text,
    style: TextStyle(fontSize: 16, color: color, fontWeight: FontWeight.bold),
  );
}
