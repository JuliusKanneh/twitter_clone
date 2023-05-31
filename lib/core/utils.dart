import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String content,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

String getUsernameFromEmail(String email) {
  return email.split('@')[0];
}
