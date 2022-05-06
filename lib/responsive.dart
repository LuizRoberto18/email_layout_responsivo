import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);
// this size work fine on my design, maybe you need some customization depends on your design

// this isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      //if our width is more than 1100 then we consider it a desktop
      if (constraints.maxWidth >= 1100) {
        return desktop;
      }
      // if width it less then 1100 and more then 650 we consider it aas tablet
      else if (constraints.maxWidth >= 650) {
        return tablet;
      }
      // Or less then that we called it mobie
      else {
        return mobile;
      }
    });
  }
}
