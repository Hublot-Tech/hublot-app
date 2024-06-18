import 'package:app/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsRow extends StatelessWidget {
  const SettingsRow({
    super.key,
    required this.press,
    required this.ville,
    required this.icon,
    required this.info,
    this.hasInfo = false,
  });
  final GestureCancelCallback press;
  final String ville, icon, info;
  final bool hasInfo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 8),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 20),
            textPresentation(
                msg: ville, fontWeight: FontWeight.normal, size: 19),
            const Spacer(),
            hasInfo
                ? textPresentation(
                    msg: info, fontWeight: FontWeight.w300, size: 19)
                : const Text(""),
            const SizedBox(width: 5),
            const Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
