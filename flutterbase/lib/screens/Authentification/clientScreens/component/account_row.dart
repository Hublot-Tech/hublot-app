import 'package:flutter/material.dart';
import 'package:flutterbase/screens/Authentification/inscriptionScreen/inscription_screen.dart';

class AccountRow extends StatelessWidget {
  const AccountRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, InscriptionScreen.routeName);
      },
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, InscriptionScreen.routeName);
              },
              icon: const Icon(
                Icons.add_circle,
                color: Colors.blue,
              )),
          const Text(
            "Creer un compte",
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
    );
  }
}
