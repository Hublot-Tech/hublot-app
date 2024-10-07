
  import 'package:app/configuration.dart';
import 'package:app/screens/part_customer/home_screens/components/hublo_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotReadyModal extends StatelessWidget {
  const NotReadyModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AnimatedOpacity(
            opacity: 1.0,
            duration: Duration(seconds: 1),
            child: HublotTextWigdet(),
          ),
          const SizedBox(height: 20),
          const RotatingSandTimer(),
          const SizedBox(height: 20),
          const AnimatedText(),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}


class RotatingSandTimer extends StatefulWidget {
  const RotatingSandTimer({super.key});

  @override
  _RotatingSandTimerState createState() => _RotatingSandTimerState();
}

class _RotatingSandTimerState extends State<RotatingSandTimer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Image.asset('img/icons8_Sand_Timer 1.png'),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AnimatedText extends StatelessWidget {
  const AnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, double value, Widget? child) {
        return Opacity(
          opacity: value,
          child: Padding(
            padding: EdgeInsets.only(top: 20 * value),
            child: textPresentation(
              maxLine: 2,
              msg: 'Pas encore prêt mais\n pour bientôt',
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              size: 30.sp,
            ),
          ),
        );
      },
    );
  }
}
