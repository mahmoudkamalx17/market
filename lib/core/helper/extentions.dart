import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  void navigateTo(String routeName) {
    Navigator.pushNamed(this, routeName);
  }

  void navigateToReplacement(String routeName) {
    Navigator.pushReplacementNamed(this, routeName);
  }

  void navigateToAndRemoveUntil(String routeName) {
    Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false);
  }

  void navigatePop() => Navigator.pop(this);
}
