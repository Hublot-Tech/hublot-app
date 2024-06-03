import 'package:flutter/material.dart';

class ShippingServices extends StatefulWidget {
  const ShippingServices({super.key});
  static String routeName = 'shipping_services';

  @override
  State<StatefulWidget> createState() => _ShippingServices();
}

// ignore: unused_element
class _ShippingServices extends State<ShippingServices> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Text(
          'Hello',
          style: TextStyle(color: Colors.redAccent),
        ),
      ),
    );
  }
}
