
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
            )),
        contentPadding: const EdgeInsets.only(left: 30),
        label: const Text("Que recherchez vous?"),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
    );
  }
}
