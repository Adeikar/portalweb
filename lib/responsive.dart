import 'package:flutter/material.dart';

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;
bool isTablet(BuildContext context) =>
    MediaQuery.of(context).size.width >= 600 &&
    MediaQuery.of(context).size.width < 1024;
bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1024;
