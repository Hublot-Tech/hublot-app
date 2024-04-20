import 'package:app/screens/part_provider/add_service/description_service/components/background_add_service.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return BackgroundAddService(widget: Container(),);
  }
}