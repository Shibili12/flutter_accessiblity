import 'package:flutter/material.dart';
import 'package:flutter_accessiblity/semantics_example.dart';
import 'package:flutter_accessiblity/text_size.dart';
import 'package:flutter_accessiblity/text_to_speech.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final FlutterTts flutterTts = FlutterTts();
  final FocusNode _textSizeFocusNode = FocusNode(debugLabel: 'Text Size');
  final FocusNode _textToSpeechFocusNode =
      FocusNode(debugLabel: 'Text to Speech');
  final FocusNode _semanticsFocusNode = FocusNode(debugLabel: 'Semantics');

  int tapCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          // Increment tapCount on each tap
          setState(() {
            tapCount = (tapCount + 1) % 3;
          });

          // Use tapCount to determine which button to focus on
          switch (tapCount) {
            case 0:
              FocusScope.of(context).requestFocus(_textSizeFocusNode);
              _speak(_textSizeFocusNode.debugLabel);
              break;
            case 1:
              FocusScope.of(context).requestFocus(_textToSpeechFocusNode);
              _speak(_textToSpeechFocusNode.debugLabel);
              break;
            case 2:
              FocusScope.of(context).requestFocus(_semanticsFocusNode);
              _speak(_semanticsFocusNode.debugLabel);

              break;
          }
        },
        onLongPress: () {
          if (tapCount == 0) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => TextSIze()),
            );
          } else if (tapCount == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => TexttoSpeech()),
            );
          } else if (tapCount == 2) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Semanticsexample()),
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Focus(
                focusNode: _textSizeFocusNode,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TextSIze()),
                    );
                  },
                  child: Text("Text Size"),
                  style: _textSizeFocusNode.hasFocus
                      ? ElevatedButton.styleFrom(backgroundColor: Colors.green)
                      : null,
                ),
              ),
              Focus(
                focusNode: _textToSpeechFocusNode,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TexttoSpeech()),
                    );
                  },
                  child: Text("Text to Speech"),
                  style: _textToSpeechFocusNode.hasFocus
                      ? ElevatedButton.styleFrom(backgroundColor: Colors.green)
                      : null,
                ),
              ),
              Focus(
                focusNode: _semanticsFocusNode,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => Semanticsexample()),
                    );
                  },
                  child: Text("Semantics"),
                  style: _semanticsFocusNode.hasFocus
                      ? ElevatedButton.styleFrom(backgroundColor: Colors.green)
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _speak(String? text) async {
    // await flutterTts.setLanguage("en-US");
    // await flutterTts.setPitch(1.0);
    // await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text!);
  }
}
