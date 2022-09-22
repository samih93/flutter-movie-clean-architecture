import 'package:flutter/foundation.dart';

class ErrorMessageModel {
  final int statusCode;
  final String status_message;
  final bool success;

  ErrorMessageModel(
      {required this.statusCode,
      required this.status_message,
      required this.success});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
        statusCode: json['status_code'],
        status_message: json['status_message'],
        success: json['success']);
  }
}
