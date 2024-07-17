import 'package:app/configuration.dart';
import 'package:app/screens/part_customer/home_screens/components/card_service_prestataire.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/controller/interfaces/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShippingServices extends StatefulWidget {
  const ShippingServices({Key? key, required this.data}) : super(key: key);

  static String routeName = 'shipping_services';
  final Services data;

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _ShippingServices(data: data);
}

class _ShippingServices extends State<ShippingServices> {
  _ShippingServices({required this.data});

  final Services data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  height: 383,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(data.img),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 34,
                          height: 34,
                          padding: const EdgeInsets.only(left: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                // Your onPressed function here
                              },
                              icon: const Icon(Icons.arrow_back_ios),
                              iconSize: 16.0,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Flexible(
                              child: Container(
                                height: 32,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF0A1128),
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.online_prediction,
                                      color: Color(0xFF00FF00),
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('En ligne',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: const Color(0xFF0A1128),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                // Your onPressed function here
                              },
                              icon: const Icon(Icons.favorite),
                              iconSize: 16.0,
                              color:
                                  const Color(0xFFFFC000), // Custom icon color
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 300,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 10000,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 26),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        cardHeader(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

Widget cardHeader() {
  return Column(
    children: <Widget>[
      Column(
        children: [
          Row(
            children: [
              SvgPicture.asset('img/start-circle.svg'),
              const Text(
                'Vérifier',
                style: TextStyle(color: Color(0xFFFFC000)),
              ),
              Container(
                width: 22,
                height: 22,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Color(0xFFFFC000)),
                child: const Icon(
                  Icons.favorite,
                  size: 10,
                ),
              ),
              const Text(
                'Recommender',
                style: TextStyle(color: Color(0xFF646464)),
              )
            ],
          )
        ],
      )
    ],
  );
}
