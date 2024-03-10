import 'package:flutter/material.dart';
import 'package:flutterbase/configuration.dart';
import 'package:flutterbase/screens/Part_Customer/homeScreens/components/home_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, HomeScrenns.routeName);
                    },
                    icon: Icon(Icons.arrow_back_ios_new)),
                Expanded(
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.only(right: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 16),
                        suffixIcon: Container(
                          height: 20,
                          width: 40,
                          margin: EdgeInsets.only(bottom: 4, top: 4, right: 4),
                          decoration: BoxDecoration(
                            color: ksecondaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 18, left: 4),
                            child: IconButton(
                              icon: Padding(
                                padding: EdgeInsets.only(bottom: 180),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        hintText: "Que recherchez vous?",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
