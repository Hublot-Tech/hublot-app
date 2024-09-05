import 'package:flutter/material.dart';
import 'package:app/configuration.dart';

class RecentChatTitle extends StatelessWidget {
  final Color? iconBGColor;
  final String title;
  final String name;
  const RecentChatTitle(
      {super.key, required this.name, this.iconBGColor, required this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  //width and height to 57 with Mediaquery.of(context).size
                  width: size.width * 0.2,
                  height: size.height * 0.09,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: kyellowColor),
                      image: const DecorationImage(
                          image: AssetImage('img/backona.png'),
                          fit: BoxFit.cover)),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textPresentation(
                        msg: name, fontWeight: FontWeight.bold, size: 19),
                    Text(
                      title,
                      style: const TextStyle(
                        color: kprimaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Josefin Sans',
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
