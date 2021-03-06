import 'package:flutter/material.dart';

class MyStyle {
  static BoxDecoration textBoxInActive() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 1, color: Color(0xff696F79)),
      borderRadius: BorderRadius.circular(8),
    );
  }

  static BoxDecoration textBoxActive() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 1, color: Color(0xff6A65D8)),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    );
  }

  static InputDecoration myInputDecor(String hint) {
    return InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
            vertical: 10), //Change this value to custom as you like
        isDense: true,
        hintText: '$hint');
  }

  static BoxDecoration containerOne() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    );
  }

  static BoxDecoration containerShadow() {
    return BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 1), // changes position of shadow
        ),
      ],
    );
  }

  static BoxDecoration containerTwo(Color color) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    );
  }

  static Color primaryColor() {
    return Color(0xFF6A65D8);
  }

  static Color primaryDarkColor() {
    return Color(0xFF1D2786);
  }

  static Color primaryLightColor() {
    return Color(0xFFC9C7F1);
  }

  static Color secondaryColor() {
    return Color(0xFFFFE6EB);
  }

  static Color secondaryDarkColor() {
    return Color(0xFF5C4A4A);
  }

  static Color secondaryLightColor() {
    return Color(0xFFFFF6F8);
  }
}
