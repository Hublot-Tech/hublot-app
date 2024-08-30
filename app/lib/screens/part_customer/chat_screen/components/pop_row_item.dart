import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/configuration.dart';

class PopRowItem extends StatelessWidget {
  const PopRowItem({
    this.color = kprimaryColor,
    super.key,
    required this.icons,
    required this.mesg,
  });
  final String icons;
  final String mesg;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 50,
      width: size.width / 2.5,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0).r,
            child: SvgPicture.asset(icons),
          ),
          4.horizontalSpace,
          textPresentation(
              msg: mesg, fontWeight: FontWeight.w400, size: 14, color: color),
        ],
      ),
    );
  }
}
