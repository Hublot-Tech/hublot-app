import 'package:app/configuration.dart';
import 'package:flutter/material.dart';

class ConfirmationScreen extends StatefulWidget {
  final TextEditingController numberController;

  const ConfirmationScreen({super.key, required this.numberController});
  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    //form key form validation
    final formKey = GlobalKey<FormState>();
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      //margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Column(children: [
                textPresentation(
                    msg: 'Confirmation de commande',
                    fontWeight: FontWeight.bold,
                    size: 20),
                const SizedBox(height: 8),
              ]),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textPresentation(
                      msg: 'Description',
                      fontWeight: FontWeight.normal,
                      size: 13.54),
                  const Icon(Icons.arrow_drop_down,
                      size: 16, color: Colors.grey),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textPresentation(
                    msg: 'De vous', fontWeight: FontWeight.normal, size: 13.54),
                textPresentation(
                    msg: 'Client', fontWeight: FontWeight.normal, size: 13.54),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textPresentation(
                    msg: 'Jean Charles',
                    fontWeight: FontWeight.bold,
                    size: 19.54),
                textPresentation(
                    msg: 'Client',
                    fontWeight: FontWeight.bold,
                    size: 18.54,
                    color: kyellowColor),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textPresentation(
                    msg: 'Vers', fontWeight: FontWeight.normal, size: 13.54),
                textPresentation(
                    msg: 'Prrestataire',
                    fontWeight: FontWeight.normal,
                    size: 13.54),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textPresentation(
                    msg: 'Jean Charles',
                    fontWeight: FontWeight.bold,
                    size: 19.54),
                textPresentation(
                    msg: 'Photographe',
                    fontWeight: FontWeight.bold,
                    size: 18.54,
                    color: kyellowColor),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textPresentation(
                    msg: 'Total', fontWeight: FontWeight.normal, size: 13.54),
                Row(
                  children: [
                    textPresentation(
                        msg: "\$865", fontWeight: FontWeight.bold, size: 18.54),
                    textPresentation(
                        msg: ' Fcfa',
                        fontWeight: FontWeight.normal,
                        size: 13.54)
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Image.asset('img/Group 138.png'),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: widget.numberController,
                    onChanged: (value) {
                      print(widget.numberController.text.isEmpty);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez saisir votre numéro de téléphone';
                      } else if (value.length > 9 || value.length < 9) {
                        return 'Veuillez saisir un numéro de téléphone valide';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "6xx xx xx xx",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder<TextEditingValue>(
                valueListenable: widget.numberController,
                builder: (context, value, child) {
                  return GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      child: Container(
                        height: 47,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: value.text.isEmpty
                                ? kFiedBgColor2
                                : kyellowColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade500,
                                blurRadius: 2,
                                offset: const Offset(0, 2),
                                spreadRadius: 1.0,
                              ),
                              const BoxShadow(
                                color: Colors.white,
                                blurRadius: 1,
                                offset: Offset(-1.0, 0),
                                spreadRadius: 0,
                              )
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'img/commande_val.png',
                              scale: 1.3,
                              color: value.text.isEmpty
                                  ? Colors.black.withOpacity(0.4)
                                  : Colors.black,
                            ),
                            const SizedBox(width: 10),
                            textPresentation(
                                msg: 'Valider la commande',
                                fontWeight: FontWeight.bold,
                                color: value.text.isEmpty
                                    ? Colors.black.withOpacity(0.4)
                                    : Colors.black,
                                size: 15.62),
                            const SizedBox(width: 6),
                            Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: Image.asset('img/Rectangle 12.png'),
                            )
                          ],
                        ),
                      ));
                })
          ],
        ),
      ),
    );
  }
}
