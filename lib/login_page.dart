import 'package:flutter/material.dart';
import 'package:flutter_accessiblity/provider_class.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final FlutterTts flutterTts = FlutterTts();
  final FocusNode _imageNode = FocusNode(debugLabel: "Image Icon");
  final FocusNode _usernameNode = FocusNode(debugLabel: "User Name Textfield");
  final FocusNode _passwordNode = FocusNode(debugLabel: "password  textfield");
  final FocusNode _buttonNode = FocusNode(debugLabel: "Login Button");

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TapNavigationprovider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        centerTitle: true,
        title: const Text("Login Page"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          provider.getTapcount();
          switch (provider.tapcount) {
            case 0:
              FocusScope.of(context).requestFocus(_imageNode);
              _speak(_imageNode.debugLabel);
              break;
            case 1:
              FocusScope.of(context).requestFocus(_usernameNode);
              _speak(_usernameNode.debugLabel);
              break;
            case 2:
              FocusScope.of(context).requestFocus(_passwordNode);
              _speak(_passwordNode.debugLabel);
            case 3:
              FocusScope.of(context).requestFocus(_buttonNode);
              _speak(_buttonNode.debugLabel);

              break;
          }
        },
        child: Center(
          child: Column(
            children: [
              Focus(
                focusNode: _imageNode,
                child: Image.network(
                  "https://img.freepik.com/free-photo/3d-render-secure-login-password-illustration_107791-16640.jpg?size=626&ext=jpg&ga=GA1.2.399695437.1688570062&semt=sph",
                  height: 300,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Focus(
                  focusNode: _usernameNode,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person,
                            color: _usernameNode.hasFocus
                                ? Colors.purple
                                : Colors.black),
                        hintText: "Enter Username",
                        hintStyle: TextStyle(
                            color: _usernameNode.hasFocus
                                ? Colors.purple
                                : Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Focus(
                  focusNode: _passwordNode,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.visibility,
                            color: _passwordNode.hasFocus
                                ? Colors.purple
                                : Colors.black),
                        hintStyle: TextStyle(
                            color: _passwordNode.hasFocus
                                ? Colors.purple
                                : Colors.black),
                        hintText: "Enter Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Focus(
                  focusNode: _buttonNode,
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _buttonNode.hasFocus
                          ? Colors.purple
                          : Colors.purple[300],
                    ),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _speak(String? text) async {
    await flutterTts.speak(text!);
  }
}
