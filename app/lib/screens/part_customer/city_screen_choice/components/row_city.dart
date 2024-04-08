import 'package:app/configuration.dart';
import 'package:flutter/material.dart';

class RowCity extends StatefulWidget {
  const RowCity({
    super.key,
    required this.cityName,
    required this.textEditingController,
  });
  final String cityName;
  final TextEditingController textEditingController;
  @override
  State<RowCity> createState() => _RowCityState();
}

class _RowCityState extends State<RowCity> {
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelect = !isSelect;
          widget.textEditingController.text = widget.cityName;
        });
      },
      child: Container(
        height: 46,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 40, top: 10),
        decoration: BoxDecoration(
          color: isSelect ? Colors.white : const Color.fromRGBO(100, 100, 100, 0.06),
          border: isSelect
              ? Border.all(color: kyellowColor, width: 2)
              : const Border(),
        ),
        child: textPresentation(
            textAlign: TextAlign.start,
            msg: widget.cityName,
            fontWeight: FontWeight.normal,
            size: 19),
      ),
    );
  }
}
