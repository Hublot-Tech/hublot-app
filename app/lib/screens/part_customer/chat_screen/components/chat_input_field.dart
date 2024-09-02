import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAttachmentPressed;
  final VoidCallback onSendPressed;

  const ChatInputField({
    Key? key,
    required this.controller,
    required this.onAttachmentPressed,
    required this.onSendPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Ecrivez un message ...",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IconButton(
                    onPressed: onAttachmentPressed,
                    icon: SvgPicture.asset(
                      'img/epingle.svg',
                      color: Colors.grey,
                    ),
                  )
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        Container(
          width: MediaQuery.of(context).size.width * 0.12,
          height: MediaQuery.of(context).size.width * 0.12,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          child: IconButton(
            icon: SvgPicture.asset(
              'img/vectorPlig.svg',
              color: Colors.white,
            ),
            onPressed: onSendPressed,
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
      ],
    );
  }
}
