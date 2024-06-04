import 'package:flutter/material.dart';
import 'package:app/controller/interfaces/services.dart';

class ShippingServices extends StatefulWidget {
  const ShippingServices({Key? key, this.data}) : super(key: key);

  static String routeName = 'shipping_services';
  final Services? data;

  @override
  State<StatefulWidget> createState() => _ShippingServices(data: data);
}

class _ShippingServices extends State<ShippingServices> {
  _ShippingServices({required this.data});

  final Services? data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shipping Services'),
        ),
        body: Center(
          child: Text(
            data!.name,
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
      ),
    );
  }
}
