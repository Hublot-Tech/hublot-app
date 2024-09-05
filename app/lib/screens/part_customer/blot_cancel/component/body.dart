import 'package:app/configuration.dart';
import 'package:app/screens/authentification/registration_screen/component/button_custom.dart';
import 'package:app/screens/components/cancel_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final motifController = TextEditingController();
    final descriptionController = TextEditingController();
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              EspaceMenuWidget(taille: 40),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close))
                ],
              ),
              EspaceMenuWidget(taille: 15),
              textPresentation(
                  msg: "Tentative d’annulation du Blot #0001",
                  fontWeight: FontWeight.w600,
                  size: 24.sp),
              EspaceMenuWidget(taille: 5),
              textPresentation(
                  msg:
                      "Toutes annulation d’un Blot pourrais engendrer un litige\nveillez specifier les causes de votre desaccord ",
                  fontWeight: FontWeight.normal,
                  maxLine: 2,
                  size: 11.sp),
              //create a form with 02 textFormField
              EspaceMenuWidget(taille: 40),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: motifController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.only(
                                  left: 15, top: 15, bottom: 15),
                              hintText: "Motif d'annulation",
                              hintStyle: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.normal)),
                        ),
                        EspaceMenuWidget(taille: 20),
                        TextFormField(
                          controller: descriptionController,
                          maxLines: 10,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.only(
                                  left: 15, top: 15, bottom: 15),
                              hintText: "Description du motif",
                              hintStyle: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.normal)),
                        ),
                        EspaceMenuWidget(),
                      ],
                    )),
              ),
              ButtomCustom(
                  msg: "Confirmer",
                  press: () {},
                  isValided: motifController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty),
              EspaceMenuWidget(taille: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: CancelButtom(press: () {
                  Navigator.pop(context);
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
