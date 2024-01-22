import 'package:flutter/material.dart';

class TextSIze extends StatefulWidget {
  const TextSIze({super.key});

  @override
  State<TextSIze> createState() => _TextSIzeState();
}

class _TextSIzeState extends State<TextSIze> {
  double textScaleFactor = 1.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("contrast : ${MediaQuery.of(context).toString()}");
    bool isHighcontrast = MediaQuery.of(context).highContrast;

    return Scaffold(
      // backgroundColor:
      //     MediaQuery.of(context).highContrast ? Colors.black : Colors.red,
      appBar: AppBar(
        centerTitle: true,
        title: Text("TEXT SIZE"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Semantics(
                explicitChildNodes: isHighcontrast,
                child: Text(
                  'Text Size: ',
                  style: TextStyle(
                    fontSize: 20 * textScaleFactor,
                  ),
                ),
              ),
              subtitle: Text(textScaleFactor.toStringAsFixed(3)),
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
            Tooltip(
              message: "Ok Button",
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("OK"),
              ),
            )
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
