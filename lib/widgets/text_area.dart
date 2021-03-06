import 'package:flutter/material.dart';

class TextAreaWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClickedCopy;

  TextAreaWidget({
    required this.text,
    required this.onClickedCopy,

  }) ;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: Container(
          height: MediaQuery.of(context).size.height*0.7,
          decoration: BoxDecoration(border: Border.all()),
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          child: SelectableText(
            text.isEmpty ? 'Scan an Image to get text' : text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const SizedBox(width: 8),


    ],
  );
}