import 'package:app/screens/part_customer/home_screens/components/hublo_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/configuration.dart';
import 'package:app/screens/authentification/customer_screens/customer_screen.dart';

import 'button_custom.dart';
import 'field_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name_controller = TextEditingController();
    TextEditingController email_controller = TextEditingController();
    TextEditingController number_controller = TextEditingController();
    TextEditingController mdp_controller = TextEditingController();

    return Stack(children: [
      Container(
        decoration: const BoxDecoration(color: ksecondaryColor),
      ),
      DraggableScrollableSheet(
        maxChildSize: .9,
        minChildSize: .2,
        initialChildSize: .9,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 20),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, CustomerScrenn.routeName);
                            },
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: SvgPicture.asset("img/croix.svg"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        const Spacer(),
                        textPresentation(
                          msg: "Inscrivez vous chez HUB",
                          fontWeight: FontWeight.w500,
                          size: 23,
                        ),
                        //HublotTextWigdet(),

                        textPresentation(
                            msg: "LOT",
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 255, 177, 59),
                            size: 23),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 10),
                    textPresentation(
                      msg:
                          "Veuillez vous assurer de la crédibilité de ces informations, car elles seront rigoureusement vérifiées",
                      fontWeight: FontWeight.w100,
                      size: 14,
                    ),
                    const SizedBox(height: 20),
                    FormInscription(
                      name_controller: name_controller,
                      email_controller: email_controller,
                      mdp_controller: mdp_controller,
                      number_controler: number_controller,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ]);
  }
}

class FormInscription extends StatefulWidget {
  const FormInscription({
    super.key,
    required this.name_controller,
    required this.email_controller,
    required this.number_controler,
    required this.mdp_controller,
  });

  final TextEditingController name_controller;
  final TextEditingController email_controller;
  final TextEditingController number_controler;
  final TextEditingController mdp_controller;

  @override
  State<FormInscription> createState() => _FormInscriptionState();
}

class _FormInscriptionState extends State<FormInscription> {
  bool isHide = true;
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        FieldForm(
          controller: widget.name_controller,
          label: "Nom et prenom",
          hint: "Nom et prenom",
        ),
        const SizedBox(height: 17),
        FieldForm(
            controller: widget.email_controller, label: "Email", hint: "Email"),
        const SizedBox(height: 17),
        TextField(
            controller: widget.number_controler,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                  top: 0,
                  left: 15,
                ),
                labelText: "+237|6xx xxx xxx",
                hintText: "Numero de telephone",
                suffixIcon: Image.asset("img/icons_whatsapp.png"),
                border: const OutlineInputBorder())),
        const SizedBox(height: 17),
        TextField(
            obscureText: isHide == false ? false : true,
            controller: widget.mdp_controller,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                  top: 0,
                  left: 15,
                ),
                labelText: "Mot de passe",
                hintText: "Mot de passe",
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isHide = !isHide;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 15, left: 10, right: 10),
                    child: textPresentation(
                        msg: "Voir", fontWeight: FontWeight.bold, size: 17),
                  ),
                ),
                border: const OutlineInputBorder())),
        const SizedBox(height: 24),
        ButtomCustom(
          press: () {
            Navigator.pushNamed(context, CustomerScrenn.routeName);
          }, msg: "S'inscrire",
        ),
      ],
    ));
  }
}

