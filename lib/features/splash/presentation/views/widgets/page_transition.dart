import 'package:flutter/widgets.dart';

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.easeInOut,
              parent: animation,
            );
            return SizeTransition(
              sizeFactor: animation,
              axisAlignment: 0,
              child: page,
            );
          },
        );
}
