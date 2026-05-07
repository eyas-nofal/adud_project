import 'package:flutter/material.dart';

enum HelpStatus { active, upcoming }

class HelpRequestModel {
  final String id;
  final String title;
  final String userName;
  final String duration;
  final String timeInfo;
  final HelpStatus status;
  final int themeColor;
  final IconData icon;

  HelpRequestModel({
    required this.id,
    required this.title,
    required this.userName,
    required this.duration,
    required this.timeInfo,
    required this.status,
    required this.themeColor,
    required this.icon,
  });
}