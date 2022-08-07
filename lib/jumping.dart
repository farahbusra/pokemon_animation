import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';


class jumpingPika extends StatefulWidget {
  const jumpingPika({Key? key}) : super(key: key);

  @override
  _jumpingPikaState createState() => _jumpingPikaState();
}

class _jumpingPikaState extends State<jumpingPika> with SingleTickerProviderStateMixin {

  bool selected = false;
  late final AnimationController animationController;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
         duration: const Duration(seconds: 1), vsync: this,)..repeat(reverse: true);

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0, 2.0),)
        .animate(CurvedAnimation(parent: animationController, curve: Curves.linear));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: SlideTransition(
      position: offset,
      child: Image.asset('assets/images/jump.png',
      height: 100,
      width: 100),
      )

  );
  }
}