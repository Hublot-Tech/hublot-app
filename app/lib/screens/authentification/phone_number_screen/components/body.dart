import 'package:app/configuration.dart';
import 'package:app/screens/authentification/registration_screen/component/button_custom.dart';
import 'package:app/screens/components/background_add_service.dart';
import 'package:app/screens/components/cross_widget.dart';
import 'package:app/screens/authentification/code_phone_screen/code_phone_screen.dart';
import 'package:app/screens/part_customer/home_screens/components/home_screen.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';


class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isChecked = false;
  bool _valiform = false;

  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _phoneController.addListener(() {
      setState(() {
        _valiform = _phoneController.text.isNotEmpty &&
            _isValidPhoneNumber(_phoneController.text);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
  }

  bool _isValidPhoneNumber(String value) {
    final regex = RegExp(r'^6[5-9]\d{7}$');
    return regex.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundAddService(
      widget: Padding(
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 05, top: 25),
              child: CrossWidgetClick(
                routeName: HomeScrenns(),
              ),
            ),
            const EspaceMenuWidget(taille: 100),
            textPresentation(
                msg: 'Votre numero de telephone',
                fontWeight: FontWeight.bold,
                size: 24.12),
            Padding(
              padding: EdgeInsets.only(
                  top: getProportionateScreenWidth(2),
                  left: getProportionateScreenWidth(21),
                  right: getProportionateScreenWidth(21)),
              child: textPresentation(
                msg:
                    'Rassurez vous que votre contact est un compte whatsapp et qu’il soit du cameroun',
                fontWeight: FontWeight.normal,
                size: 11,
              ),
            ),
            Container(
              constraints: const BoxConstraints(minHeight: 90),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                        labelText: 'Numéro whatsapp',
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: kprimaryColor,
                            width: 1,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: kprimaryColor,
                            width: 2,
                          ),
                        ),
                        hintStyle: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                                color: kprimaryColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w300)),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veillez entrer votre numéro de télephone';
                      }

                      if (!RegExp(r'^6[5-9]\d{7}$').hasMatch(value)) {
                        return 'Ce numéro n\'est pas camerounais';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (ischeck) {
                      setState(() {
                        isChecked = ischeck!;
                      });
                    }),
                textPresentation(
                    msg: 'Vous accepetez les ',
                    fontWeight: FontWeight.normal,
                    size: 10),
                textPresentation(
                    msg: ' termes et conditions',
                    fontWeight: FontWeight.normal,
                    color: kCategoriecolor,
                    size: 10),
              ],
            ),
            ButtomCustom(
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const CodePhoneScreem();
                  },settings: RouteSettings(arguments: _phoneController.text)));
                  // Nav.to(
                  //     context,
                  //     CodePhoneScreem(
                  //         phoneNumber: _phoneController.text.toString()));
                },
                msg: 'Confirmer',
                isValided: isChecked && _valiform),
          ],
        ),
      ),
    );
  }
}
