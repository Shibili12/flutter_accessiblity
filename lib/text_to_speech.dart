import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TexttoSpeech extends StatelessWidget {
  TexttoSpeech({super.key});

  final FlutterTts flutterTts = FlutterTts();
  final textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TEXT TO SPEECH"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: textcontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Type Something to speak"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (textcontroller.text != "") {
                  _speak(textcontroller.text);
                }
              },
              child: Text('Speak'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _speak(String text) async {
    // await flutterTts.setLanguage("en-US");
    // await flutterTts.setPitch(1.0);
    // await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }
}
