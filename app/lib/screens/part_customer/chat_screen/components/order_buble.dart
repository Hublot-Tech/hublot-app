import 'package:app/blocs/service/bloc/service_bloc.dart';
import 'package:app/configuration.dart';
import 'package:app/model/offer_model.dart';
import 'package:app/model/service.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderBuble extends StatelessWidget {
  const OrderBuble({
    super.key,
    required this.isMe,
    required this.id,
  });
  final bool isMe;
  final String id;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ServiceBloc>(context).add((FetchServiceAndOffer(id)));
    ServiceDetails serviceDetails = ServiceDetails.isEmpy();
    List<OfferDetails> offerDetails = [];
    OfferDetails firstOffer = OfferDetails.isEmpty();
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ServiceBloc, ServiceState>(
      builder: (context, state) {
        // if (state is ServiceFetchingByIdLoading) {
        //   return Center(
        //     child: textPresentation(
        //         msg: 'Je suis intéressé(e) par votre service',
        //         fontWeight: FontWeight.w400,
        //         size: 16,
        //         color: isMe ? kColorWhite : kColorBlack),
        //   );
        // }
        if (state is ServiceAndOfferFetchById) {
          serviceDetails = state.services;
          offerDetails = state.offer;
          if (offerDetails.isNotEmpty) {
            // Supposons que vous souhaitez afficher le premier élément de la liste
            firstOffer = offerDetails[0];
          }
        }
        // if (state is ErrorServiceFetchingByIdState) {
        //   return Center(child: Text("Error"));
        // }
        return SizedBox(
          width: size.width * 0.9,
          height: size.width * 0.808,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width * 0.9,
                height: 140,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18)),
                ),
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18)),
                    child: Image.network(serviceDetails.mainImageRef!,
                        fit: BoxFit.cover)),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 16, top: 13, bottom: 15, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 1),
                    Row(
                      children: [
                        textPresentation(
                            msg: 'Bonjour',
                            color: isMe ? kColorWhite : kColorBlack,
                            fontWeight: FontWeight.w400,
                            size: 16.r),
                        4.horizontalSpace,
                        textPresentation(
                          msg: serviceDetails.provider.fullname,
                          fontWeight: FontWeight.bold,
                          size: 16,
                          color: isMe ? kColorWhite : kColorBlack,
                        ),
                      ],
                    ),
                    textPresentation(
                        msg: 'Je suis intéressé(e) par votre service',
                        fontWeight: FontWeight.w400,
                        size: 16,
                        color: isMe ? kColorWhite : kColorBlack),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.r),
                      padding:
                          const EdgeInsets.only(left: 10, top: 10, bottom: 10)
                              .r,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kyellowColor),
                      child: Row(
                        children: [
                          textPresentation(
                              msg: 'Photographe',
                              fontWeight: FontWeight.bold,
                              size: 18.5,
                              color: isMe ? kprimaryColor : kColorBlack),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Container(
                        padding: const EdgeInsets.only(
                            left: 0, top: 0, bottom: 8, right: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kyellowColor),
                        child: OfferNamePrice(
                            isMe: isMe,
                            price: firstOffer.price.toString(),
                            photographe: firstOffer.name)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class OfferNamePrice extends StatelessWidget {
  const OfferNamePrice({
    super.key,
    required this.isMe,
    required this.price,
    required this.photographe,
  });

  final bool isMe;
  final String price, photographe;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 170,
          child: textPresentation(
            msg: photographe,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            size: 14,
            color: isMe ? kprimaryColor : kColorBlack,
          ),
        ),
        textPresentation(
          msg: '$price FCFA',
          fontWeight: FontWeight.bold,
          size: 16,
          color: isMe ? kprimaryColor : kColorBlack,
        ),
      ],
    );
  }
}
