import 'dart:io';

import 'package:google_ml_kit/google_ml_kit.dart';

class FirebaseMLApi {
  static Future<String> recogniseText(File imageFile) async {
    if (imageFile == null) {
      return 'No selected image';
    } else {
      final visionImage = InputImage.fromFile(imageFile);
      final textDetector = GoogleMlKit.vision.textDetector();
      try {
        final RecognisedText recognisedText = await textDetector.processImage(visionImage);
        await textDetector.close();

        final text = extractText(recognisedText);
        return text.isEmpty ? 'No text found in the image' : text;
      } catch (error) {
        return error.toString();
      }
    }
  }

  static extractText(RecognisedText recognisedText) {
    String text = '';

    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          text = text + word.text + ' ';
        }
        text = text + '\n';
      }
    }
    print('======${text}');

    return text;
  }
}
