import 'package:flutter/material.dart';
import 'package:flutter_accessiblity/homepage.dart';

class Semanticsexample extends StatelessWidget {
  const Semanticsexample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accessibility Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Handle button press
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Homepage()));
              },
              child: Semantics(
                label: ' go to home page',
                child: Text('Home page'),
              ),
            ),
            SizedBox(height: 20),
            Semantics(
              label: 'Text Input Field',
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Text',
                ),
                autofocus: true,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onSubmitted: (String value) {
                  // Handle text field submission
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
