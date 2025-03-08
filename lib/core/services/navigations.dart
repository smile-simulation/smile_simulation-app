import 'package:flutter/material.dart';

Future<dynamic> navigateWithoutBack(BuildContext context, Widget view) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => view),
  );
}

Future<dynamic> navigateTo(BuildContext context, Widget view) {
  return Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (_, __, ___) => view,
      transitionsBuilder: (_, animation, __, child) {
        final fadeAnimation = animation.drive(
          CurveTween(curve: Curves.easeInOut),
        );

        return FadeTransition(
          opacity: fadeAnimation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.9, end: 1.0).animate(fadeAnimation),
            child: child,
          ),
        );
      },
    ),
  );
}
