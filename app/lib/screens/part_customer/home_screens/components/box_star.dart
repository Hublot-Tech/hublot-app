import 'package:app/controller/interfaces/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/configuration.dart';

class BoxStar extends StatelessWidget {
  const BoxStar({
    super.key,
    required this.size,
    required this.serviceData,
  });

  final Size size;
  final Services serviceData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: size.width * 0.2,
      height: size.height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromRGBO(10, 17, 40, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AddFavorite(serviceData: serviceData),
          textPresentation(
              msg: serviceData.note,
              fontWeight: FontWeight.normal,
              color: Colors.white,
              size: 22)
        ],
      ),
    );
  }
}

class AddFavorite extends StatefulWidget {
  const AddFavorite({super.key, required this.serviceData});
  final Services serviceData;

  @override
  State<StatefulWidget> createState() => _AddFavorite();
}

class _AddFavorite extends State<AddFavorite> {
  @override
  Widget build(BuildContext context) {
    Services serviceData = widget.serviceData;

    return GestureDetector(
      onTap: () => setState(() {
        serviceData.favorite = !serviceData.favorite;
      }),
      child: serviceData.favorite
          ? SvgPicture.asset('img/icons8_star 2.svg')
          : SvgPicture.asset('img/icons8_star_white.svg'),
    );
  }
}
