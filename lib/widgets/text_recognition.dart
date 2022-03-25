import 'dart:io';


import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:texty/widgets/text_area.dart';
import 'package:texty/Api/api.dart';
import 'package:texty/widgets/control_widget.dart';

import '../text.dart';
import 'control_widget.dart';


class TextRecognitionWidget extends StatefulWidget {


  @override
  _TextRecognitionWidgetState createState() => _TextRecognitionWidgetState();
}

class _TextRecognitionWidgetState extends State<TextRecognitionWidget> {

  File? image;

  @override
  Widget build(BuildContext context) => Expanded(
    child: Column(
      children: [
        Expanded(child: buildImage()),
        const SizedBox(height: 16),
        ControlsWidget(
          onClickedPickImage: pickImage,
          onClickedScanText: scanText,
          onClickedClear: clear,
        ),
        const SizedBox(height: 16),

      ],
    ),
  );

  Widget buildImage() => Container(
    child: image != null
        ? Image.file(image!)
        : Icon(Icons.photo, size: 80, color: Colors.black),
  );

  Future pickImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);

    File? file_cropped = await ImageCropper().cropImage(
      sourcePath: file!.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 100,
      maxHeight: 700,
      maxWidth: 700,
      compressFormat: ImageCompressFormat.jpg,
      androidUiSettings: AndroidUiSettings(toolbarColor: Color.fromRGBO(115, 79, 150, 1),
      toolbarTitle: "Cropper",
      statusBarColor: Color.fromRGBO(115, 79, 150, 1),
      backgroundColor: Colors.white,

      )

    );
    setImage(File(file_cropped!.path));

  }

  Future scanText() async {


    final text = await FirebaseMLApi.recogniseText(image!);
    Navigator.push(context,MaterialPageRoute(builder:(context)=>TextCopy(text)));




  }

  void clear() {
    setImage(File("assets/cam.png"));

  }



  void setImage(File newImage) {
    setState(() {
      image = newImage;
    });
  }


}