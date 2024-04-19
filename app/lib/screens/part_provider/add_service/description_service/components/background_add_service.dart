import 'package:flutter/material.dart';

class BackgroundAddService extends StatelessWidget {
  const BackgroundAddService({
    super.key,
    required this.widget,
  });
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 165,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
              Container(
                height: 705,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
              ),
            ],
          ),
        ),
        DraggableScrollableSheet(
            maxChildSize: .9,
            minChildSize: .5,
            initialChildSize: .9,
            builder: (context, scroolController) {
              return Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: SingleChildScrollView(
                    controller: scroolController, child: widget),
              );
            }),
      ],
    );
  }
}
