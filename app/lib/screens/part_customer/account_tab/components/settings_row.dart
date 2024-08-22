import 'package:app/configuration.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsRow extends StatelessWidget {
  const SettingsRow({
    super.key,
    required this.press,
    required this.ville,
    this.icon,
    this.hasFlesh,
    required this.info,
    this.hasInfo = false,
  });
  final GestureCancelCallback press;
  final String ville, info;
  final String? icon;
  final bool hasInfo;
  final bool? hasFlesh;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.only(bottom: hasFlesh == false ? 0 : 30, left: 8),
        child: Row(
          children: [
            SvgPicture.asset(icon!),
            const SizedBox(width: 20),
            textPresentation(
                msg: ville, fontWeight: FontWeight.normal, size: 19),
            const Spacer(),
            hasInfo
                ? textPresentation(
                    msg: info, fontWeight: FontWeight.w300, size: 19)
                : const Text(""),
            const SizedBox(width: 5),
            hasFlesh == false
                ? const Text('')
                : const Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
