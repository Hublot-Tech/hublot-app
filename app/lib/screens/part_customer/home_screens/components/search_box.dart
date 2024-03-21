import 'package:flutter/material.dart';
import 'package:app/screens/part_customer/search_screens/search_screen.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      canRequestFocus: false,
      onTap: () {
        Navigator.pushNamed(context, SearchScreen.routeName);
      },
      decoration: InputDecoration(
        prefixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
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
    );
  }
}
