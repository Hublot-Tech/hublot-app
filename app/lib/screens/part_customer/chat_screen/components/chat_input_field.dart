import 'package:app/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatInputField extends StatefulWidget {
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
  _ChatInputFieldState createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _hasText = widget.controller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 50, // MediaQuery.of(context).size.width * 0.14,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: "Ecrivez un message ...",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: IconButton(
                      onPressed: widget.onAttachmentPressed,
                      icon: SvgPicture.asset(
                        'img/icons8_attach_1 1.svg',
                        color: Colors.grey,
                      ),
                    )),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        Container(
          width: MediaQuery.of(context).size.width * 0.12,
          height: MediaQuery.of(context).size.width * 0.12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _hasText
                ? kprimaryColor
                : const Color.fromARGB(255, 239, 40, 40),
          ),
          child: IconButton(
            icon: SvgPicture.asset(
              'img/icons8_right_2 1.svg',
              color: Colors.white,
            ),
            onPressed:
                widget.controller.text.isNotEmpty ? null : widget.onSendPressed,
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
      ],
    );
  }
}
