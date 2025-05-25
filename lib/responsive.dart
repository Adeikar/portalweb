import 'package:flutter/material.dart';

bool isMobile(BuildContext context) =>
    MediaQuery.of(context).size.width < 600;

bool isTablet(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return width >= 600 && width < 1024;
}

bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 1024;
