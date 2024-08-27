import 'package:app/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class StepColumn extends StatefulWidget {
  const StepColumn({
    super.key,
    required this.isClick,
    required this.msg,
  });
  final bool isClick;
  final String msg;
  @override
  State<StepColumn> createState() => _StepColumnState();
}

class _StepColumnState extends State<StepColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          6.horizontalSpace,
          SvgPicture.asset('img/Vector 3730.svg'),
          15.horizontalSpace,
          textPresentation(
              msg: widget.msg, size: 15.3, fontWeight: FontWeight.w600),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
        ]),
        widget.isClick
            ? Padding(
                padding: const EdgeInsets.only(left: 48, right: 50),
                child: textPresentation(
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.justify,
                    msg:
                        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonu Lorem ipsum dolor sit amet, consectetuer adipiscing",
                    fontWeight: FontWeight.normal,
                    size: 12),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}

class SteppItemValided extends StatelessWidget {
  const SteppItemValided({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 192, 0, 0.51),
          borderRadius: BorderRadius.circular(31)),
      child: Container(
        decoration: BoxDecoration(
          color: kyellowColor,
          borderRadius: BorderRadius.circular(21),
        ),
        child: const Icon(Icons.check, size: 20),
      ),
    );
  }
}

class StepperConnector extends StatelessWidget {
  final bool isCompleted;

  const StepperConnector({super.key, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.12,
      height: 4,
      color: isCompleted ? kyellowColor : Colors.grey,
    );
  }
}
