import 'package:flutter/material.dart';

class ControlsWidget extends StatelessWidget {
  final VoidCallback onClickedPickImage;
  final VoidCallback onClickedScanText;
  final VoidCallback onClickedClear;

  ControlsWidget({
    required this.onClickedPickImage,
    required this.onClickedScanText,
    required this.onClickedClear,

  }) ;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onClickedPickImage,
          style:ElevatedButton.styleFrom(
            primary: Color.fromRGBO(115, 79, 150, 1),

          ),
          child: Text('Pick Image'),
        ),
     Spacer(),
        ElevatedButton(
          onPressed: onClickedScanText,
          style:ElevatedButton.styleFrom(
            primary: Color.fromRGBO(115, 79, 150, 1),

          ),
          child: Text('Scan For Text'),
        ),

        // ElevatedButton(
        //   onPressed: onClickedClear,
        //   style:ElevatedButton.styleFrom(
        //     primary: Color.fromRGBO(115, 79, 150, 1),
        //
        //   ),
        //   child: Text('Clear'),
        // )
      ],
    ),
  );
}
