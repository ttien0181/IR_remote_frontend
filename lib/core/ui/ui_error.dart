import 'package:flutter/material.dart';
import '../errors/app_exception.dart';

void showAppError(BuildContext context, Object error) {
  final msg = (error is AppException) ? error.message : error.toString();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(msg), backgroundColor: Colors.red),
  );
}
