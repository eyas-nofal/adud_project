import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

// هاد الكود كامل، انسخه زي ما هو
void showCustomFlushbar(
  BuildContext context,
  String message, {
  bool success = true, 
}) {
  Flushbar(
    margin: const EdgeInsets.all(16),
    borderRadius: BorderRadius.circular(12),
    backgroundColor: success ? Colors.green : Colors.red,
    icon: Icon(
      success ? Icons.check_circle : Icons.error, 
      color: Colors.white,
    ),
    message: message,
    duration: const Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.TOP,
    animationDuration: const Duration(milliseconds: 500),
  ).show(context);
}