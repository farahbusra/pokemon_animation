import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class movingRocks extends StatefulWidget {
  const movingRocks({Key? key}) : super(key: key);

  @override
  State<movingRocks> createState() => _movingRocksState();
}

class _movingRocksState extends State<movingRocks> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 4),vsync: this,)..repeat(reverse: false);

    offset = Tween<Offset>(begin: Offset(3,0), end: Offset(-3, 0))
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));

  }

    @override
    void dispose(){
    super.dispose();
    this.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SlideTransition(
        position: offset,
        child: Image.asset('assets/images/stone.png',
            height: 100,
            width: 100),
      )

    );
  }
}