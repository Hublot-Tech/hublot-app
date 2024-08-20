import 'package:app/screens/authentification/registration_screen/component/button_custom.dart';
import 'package:app/screens/components/background_add_service.dart';
import 'package:app/screens/components/cancel_button.dart';
import 'package:app/screens/part_customer/chat_screen/chat_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/blocs/auth/auth_form_bloc.dart';
import 'package:app/blocs/auth/auth_form_state.dart';
import 'package:app/blocs/blot/bloc/blot_bloc.dart';
import 'package:app/blocs/message/bloc/chat_bloc.dart';
import 'package:app/configuration.dart';
import 'package:app/model/blot_entity.dart';

import 'package:app/model/info_client.dart';
import 'package:app/model/message_detail.dart';
import 'package:app/services/toastServices.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'decoration_box_widget.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    String? provider;
    final InfoClient args =
        ModalRoute.of(context)!.settings.arguments as InfoClient;
    final int endJour =
        args.blotEntity!.startDate.day + args.blotEntity!.duration;
    final DateTime endDate = DateTime(args.blotEntity!.startDate.year,
        args.blotEntity!.startDate.month, endJour);
    var isLoading = false;
    return BackgroundAddService(
      widget: Padding(
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(5),
            right: getProportionateScreenWidth(5)),
        child: Column(
          children: [
            const EspaceMenuWidget(),
            Container(
              height: getProportionateScreenHeight(46),
              width: getProportionateScreenWidth(46),
              padding: EdgeInsets.only(left: getProportionateScreenWidth(5)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(46),
                color: kprimaryColor,
              ),
              child: SvgPicture.asset(
                "img/bot_icon.svg",
                fit: BoxFit.scaleDown,
              ),
            ),
            const EspaceMenuWidget(taille: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textPresentation(
                    msg: "BLOT  #", fontWeight: FontWeight.bold, size: 24.12),
                textPresentation(
                    msg: '0001', fontWeight: FontWeight.normal, size: 24.12),
              ],
            ),
            Center(
                child: textPresentation(
                    msg: "Détails", fontWeight: FontWeight.normal, size: 15)),
            const EspaceMenuWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textPresentation(
                    msg: 'Offre de base',
                    fontWeight: FontWeight.bold,
                    size: 24.12),
                const Spacer(),
                DecorationBoxWidget(
                    width: 100,
                    height: 40,
                    color: kyellowColor,
                    havePadding: true,
                    args: Center(
                      child: textPresentation(
                          msg: "${args.blotEntity!.price.toString()} FCFA",
                          fontWeight: FontWeight.bold,
                          color: kprimaryColor,
                          size: 15),
                    )),
              ],
            ),
            const EspaceMenuWidget(),
            Row(
              children: [
                textPresentation(
                    msg: "Nom du prestataire",
                    fontWeight: FontWeight.w600,
                    size: 24.12),
              ],
            ),
            Container(
              height: 40,
              width: 390,
              decoration: BoxDecoration(
                  color: kyellowColor, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: textPresentation(
                    msg: "Gislain", fontWeight: FontWeight.w600, size: 24.36),
              ),
            ),
            const EspaceMenuWidget(),
            Padding(
              padding: EdgeInsets.only(right: getProportionateScreenWidth(120)),
              child: textPresentation(
                  overflow: TextOverflow.visible,
                  msg: "Nom du client",
                  fontWeight: FontWeight.w600,
                  size: 24.12),
            ),
            Container(
              height: 40,
              width: 390,
              decoration: BoxDecoration(
                  color: kyellowColor, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: textPresentation(
                    msg: args.name, fontWeight: FontWeight.w600, size: 24.36),
              ),
            ),
            EspaceMenuWidget(),
            Row(
              children: [
                textPresentation(
                    msg: "Service sélectionné",
                    fontWeight: FontWeight.w600,
                    size: 24.12),
              ],
            ),
            DecorationBoxWidget(
              width: 390,
              height: 40,
              color: kyellowColor,
              havePadding: true,
              args: Center(
                child: textPresentation(
                    msg: "Photographie",
                    fontWeight: FontWeight.w600,
                    size: 24.36),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: getProportionateScreenWidth(90)),
              child: textPresentation(
                  msg: "Résumer de l’échange",
                  fontWeight: FontWeight.w600,
                  size: 24.12),
            ),
            const EspaceMenuWidget(taille: 4),
            Padding(
              padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
              child: Row(
                children: [
                  textPresentation(
                      msg: args.blotEntity!.description,
                      fontWeight: FontWeight.normal,
                      size: 15,
                      textAlign: TextAlign.justify),
                ],
              ),
            ),
            const EspaceMenuWidget(),
            Padding(
              padding: EdgeInsets.only(right: getProportionateScreenWidth(98)),
              child: textPresentation(
                  msg: "Options selectionnés",
                  fontWeight: FontWeight.bold,
                  size: 24.12),
            ),
            const EspaceMenuWidget(),
            DecorationBoxWidget(
              width: 390,
              height: 40,
              color: kyellowColor,
              havePadding: true,
              args: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textPresentation(
                      msg: "Tenues", fontWeight: FontWeight.normal, size: 16),
                  textPresentation(
                      msg: "10 000 FCFA",
                      fontWeight: FontWeight.bold,
                      color: kprimaryColor,
                      size: 15),
                ],
              ),
            ),
            const EspaceMenuWidget(),
            Padding(
              padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
              child: textPresentation(
                  msg: "Délais de la tâche à effectuer",
                  fontWeight: FontWeight.bold,
                  size: 24.12),
            ),
            Row(
              children: [
                textPresentation(
                    msg: 'L’échéance de livraisons est prevu du ',
                    fontWeight: FontWeight.normal,
                    size: 16),
                DecorationBoxWidget(
                  args: Center(
                    child: textPresentation(
                        msg:
                            '${args.blotEntity!.startDate.day.toString()}/${args.blotEntity!.startDate.month.toString()}/${args.blotEntity!.startDate.year.toString()}',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        size: 14),
                  ),
                  height: 26,
                  width: 61,
                  color: ksecondaryColor,
                  havePadding: false,
                ),
              ],
            ),
            Row(
              children: [
                textPresentation(
                    msg: 'au   ', fontWeight: FontWeight.normal, size: 14),
                DecorationBoxWidget(
                  args: Center(
                    child: textPresentation(
                        msg:
                            '${endDate.day.toString()}/${endDate.month.toString()}/${endDate.year.toString()}',
                        fontWeight: FontWeight.bold,
                        size: 18),
                  ),
                  height: 26,
                  width: 91,
                  color: kyellowColor,
                  havePadding: false,
                ),
              ],
            ),
            const EspaceMenuWidget(),
            Row(
              children: [
                textPresentation(
                    overflow: TextOverflow.visible,
                    msg: "Entreprise de mise en relation",
                    fontWeight: FontWeight.w600,
                    size: 24.12),
              ],
            ),
            const EspaceMenuWidget(taille: 4),
            Padding(
              padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
              child: textPresentation(
                  overflow: TextOverflow.visible,
                  msg:
                      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit,t, consectetuer adipiscing elit, sed diam nonu...',
                  fontWeight: FontWeight.normal,
                  size: 15,
                  textAlign: TextAlign.justify),
            ),
            const EspaceMenuWidget(),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthUserProfile) {
                  user = state.user;

                  provider = user.id;
                } else {
                  provider = '';
                }
                return BlocListener<ChatBloc, ChatState>(
                  listener: (context, state) {
                    if (state is ChatSendState) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ChatScreen(
                            name: args.name, interlocutor: args.id);
                      }));
                    } else if (state is ChatError) {
                      ToastService.errorMessage(state.error.message);
                      print(state.error.message);
                    }
                  },
                  child: BlocListener<BlotBloc, BlotState>(
                    listener: (context, state) {
                      if (state is BlotErrorState) {
                        isLoading = !isLoading;
                        ToastService.errorMessage(state.message.message);
                      } else if (state is BlotCreating) {
                        isLoading = !isLoading;
                      } else if (state is BlotCreated) {
                        isLoading = !isLoading;
                        ToastService.successMessage(
                            'Votre blot a ete envoye!', kyellowColor);
                        //create a message with a blotid and send to client with id interlocutor
                        String receiveir = args.id;
                        String blotId = state.blotResponse.data.id;
                       
                        CreateMessage createMessage = CreateMessage(
                          contentType: "blot",
                          resource: blotId,
                          content: 'Blot001',
                          receiver: receiveir,
                        );

                        context
                            .read<ChatBloc>()
                            .add(ChatSendMessageEvent(message: createMessage));
                      }
                    },
                    child: ButtomCustom(
                      isValided: true,
                      loading: isLoading,
                      msg: 'Envoyer',
                      press: () {
                        BlotEntity blotEntity = BlotEntity(
                            option: [],
                            price: args.blotEntity!.price,
                            provider: provider,
                            offer: args.blotEntity!.offer,
                            description: args.blotEntity!.description,
                            status: args.blotEntity!.status,
                            consumer: args.blotEntity!.consumer,
                            startDate: args.blotEntity!.startDate,
                            duration: args.blotEntity!.duration);
                        context
                            .read<BlotBloc>()
                            .add(BlotCreatedEvent(blotEntity: blotEntity));
                      },
                    ),
                  ),
                );
              },
            ),
            const EspaceMenuWidget(),
            CancelButtom(press: () {
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }
}
