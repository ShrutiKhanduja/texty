import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:texty/widgets/text_area.dart';
import 'package:url_launcher/url_launcher.dart';

class TextCopy extends StatefulWidget {
  String text;
 TextCopy(this.text);

  @override
  _TextCopyState createState() => _TextCopyState();
}

class _TextCopyState extends State<TextCopy> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Woohoo 🎉 Here is your image conversion',style:GoogleFonts.dongle(color:Color.fromRGBO(115, 79, 150, 1),fontSize: MediaQuery.of(context).size.height*0.03)),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextAreaWidget(
                text: widget.text,
                onClickedCopy: copyToClipboard,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: copyToClipboard,
                  style:ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(115, 79, 150, 1),

                  ),
                  child: Text('Copy text'),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: (){
                    _launchURL("https://www.google.com/search?q=${widget.text}");
                  },
                  style:ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(115, 79, 150, 1),

                  ),
                  child: Text('Search on web'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
  void copyToClipboard() {
    if (widget.text.trim() != '') {
      FlutterClipboard.copy(widget.text);
      Fluttertoast.showToast(
          msg: "Copied to clipboard",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromRGBO(115, 79, 150, 1),
          textColor: Colors.white,
          fontSize: 16.0
      );

    }
  }
  void setText(String newText) {
    setState(() {
      widget.text = newText;
    });
  }
}
