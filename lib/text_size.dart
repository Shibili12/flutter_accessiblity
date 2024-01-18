import 'package:flutter/material.dart';

class TextSIze extends StatefulWidget {
  const TextSIze({super.key});

  @override
  State<TextSIze> createState() => _TextSIzeState();
}

class _TextSIzeState extends State<TextSIze> {
  double textScaleFactor = 1.0; // Initial text scale factor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TEXT SIZE"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Text Size: ${textScaleFactor.toString()}',
              style: TextStyle(fontSize: 20 * textScaleFactor),
            ),
            SizedBox(height: 20),
            Slider(
              value: textScaleFactor,
              min: 0.5,
              max: 2.0,
              onChanged: (value) {
                updateTextScaleFactor(value);
              },
            ),
          ],
        ),
      ),
    );
  }

  void updateTextScaleFactor(double factor) {
    setState(() {
      textScaleFactor = factor;
    });
  }
}
