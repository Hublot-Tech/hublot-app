import 'package:app/screens/part_customer/home_screens/components/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../presentation_screens/components/presention_screen.dart';

class CrossWidget extends StatelessWidget {
  const CrossWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 40, top: 40),
      child: Row(
        children: [
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, HomeScrenns.routeName);
            },
            child: SizedBox(
              width: 26,
              height: 26,
              child: SvgPicture.asset("img/croix.svg"),
            ),
          ),
        ],
      ),
    );
  }
}
