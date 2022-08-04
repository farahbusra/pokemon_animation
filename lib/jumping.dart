import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';


class jumpingPika extends StatefulWidget {
  const jumpingPika({Key? key}) : super(key: key);

  @override
  _jumpingPikaState createState() => _jumpingPikaState();
}

class PlaygroundPainter extends CustomPainter {
  PlaygroundPainter({required this.animationValue});

  final double animationValue;

  @override
  void paint(Canvas canvas, Size size) {
    /// We shift the coordinates to the center of the screen
    canvas.translate(size.width / 2, size.height / 2);

    final circlePosition = Offset.lerp(
        const Offset(0, 120), const Offset(0, -120), animationValue)!;

    /// draws a circle of radius 40 and give it the position above
    canvas.drawCircle(circlePosition, 40, Paint()..color = Colors.red);
  }

  /// We expect this to re-paint when there's a change in animation value
  @override
  bool shouldRepaint(PlaygroundPainter oldDelegate) => true;

}

class _jumpingPikaState extends State<jumpingPika> with SingleTickerProviderStateMixin {

  late final AnimationController animationController;
  late final Animation animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
         duration: const Duration(milliseconds: 2500), vsync: this,)..repeat(reverse: true);

    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut);
    animation.addListener(() {
      setState(() {});
    });

    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomPaint(
      size: size,
      painter: PlaygroundPainter(animationValue: animation.value),
    );
    // return Container(
    //     // child: SlideTransition(
    //       // position: offset,
    //       child: Image.asset('assets/images/jump.png',
    //           height: 100,
    //           width: 100),
    //     // )
    //
    // );
  }
}