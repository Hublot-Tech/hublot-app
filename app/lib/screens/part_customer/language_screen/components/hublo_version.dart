import 'package:app/configuration.dart';
import 'package:flutter/material.dart';

class VersionHublo extends StatelessWidget {
  const VersionHublo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: textPresentation(
        msg: "Version 1.1",
        fontWeight: FontWeight.w300,
        size: 13,
      ),
    );
  }
}
