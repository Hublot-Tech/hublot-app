import 'package:flutter/material.dart';
import 'package:app/screens/authentification/registration_screen/register_screen.dart';

class AccountRow extends StatelessWidget {
  const AccountRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RegistrationScreen.routeName);
      },
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.routeName);
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
