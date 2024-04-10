import 'package:flutter/material.dart';

import 'component/body.dart';

class AnswerScreen extends StatelessWidget {
  const AnswerScreen({super.key, this.searchWord = "null"});
  final String searchWord;
  static String routeName = "/answer_screnn";

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      body: Body(searchWord: searchWord),
    );
  }
}
