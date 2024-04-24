import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/part_customer/search_screens/search_screen.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
      child: TextField(
        canRequestFocus: false,
        onTap: () {
          Navigator.pushNamed(context, SearchScreen.routeName);
        },
        decoration: InputDecoration(
          prefixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: getProportionateScreenWidth(30),
              )),
          contentPadding: const EdgeInsets.only(left: 30),
          label: const Text("Que recherchez vous?"),
          hintText: 'ed',
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
