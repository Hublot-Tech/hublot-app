import 'package:app/configuration.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

class AnimatedContenu extends StatelessWidget {
  const AnimatedContenu(
      {super.key, required this.currentIndex, required this.index, required this.nbre});

  final int currentIndex, index,nbre;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          List.generate(nbre, (index) => buildot(index: index)),
    );
  }

  AnimatedContainer buildot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 2),
      margin: const EdgeInsets.all(4),
      height: getProportionateScreenHeight(15),
      width: getProportionateScreenWidth(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: currentIndex == index ? kprimaryColor : ksecondaryColor,
      ),
    );
  }
}
