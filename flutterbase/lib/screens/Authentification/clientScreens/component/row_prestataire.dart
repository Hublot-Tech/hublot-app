import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../presentationScreens/components/presention_screen.dart';

class RowPrestataire extends StatelessWidget {
  const RowPrestataire({
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
              Navigator.pushNamed(context, PresentationScreen.routeName);
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
