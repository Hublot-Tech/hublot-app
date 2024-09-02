import 'package:flutter/material.dart';
import 'package:app/model/send_menu_item.dart';
import 'package:app/configuration.dart';

class ChatBottomSheet extends StatelessWidget {
  final List<SendMenuItem> menuItems;

  const ChatBottomSheet({Key? key, required this.menuItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kColorWhite,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(20)
        )
      ),
      child: Column(
        children: [
          Center(
            child: Container(
              height: 4,
              width: 58,
              color: Colors.grey.shade200,
            )
          ),
          ListView.builder(
            itemCount: menuItems.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: menuItems[index].color.shade100,
                    ),
                    height: 50,
                    width: 50,
                    child: Icon(
                      menuItems[index].icons,
                      size: 20,
                      color: menuItems[index].color.shade400,
                    ),
                  ),
                  title: Text(
                    menuItems[index].text,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12
                    ),
                  ),
                ),
              );
            }
          )
        ],
      ),
    );
  }
}
