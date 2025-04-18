import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learning_isolates/imageParser/image_parser_view.dart';
import 'package:rive/rive.dart';




/// An example application demoing Rive.
class RiveExampleView extends StatefulWidget {
  const RiveExampleView({Key? key}) : super(key: key);

  @override
  State<RiveExampleView> createState() => _RiveExampleAppState();
}

class _RiveExampleAppState extends State<RiveExampleView> {
  // Examples
  final _pages = [
     _Page('Simple Animation - Asset', ImageParserView()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rive Examples')),
      body: Center(
    child: RiveAnimation.network(""),
    ),
    );
  }
}

/// Class used to organize demo pages.
class _Page {
  final String name;
  final Widget page;

  const _Page(this.name, this.page);
}

/// Button to navigate to demo pages.
class _NavButton extends StatelessWidget {
  const _NavButton({required this.page});

  final _Page page;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: SizedBox(
          width: 250,
          child: Center(
            child: Text(
              page.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => page.page,
            ),
          );
        },
      ),
    );
  }
}

const _appBarColor = Color(0xFF323232);
const _backgroundColor = Color(0xFF1D1D1D);
const _primaryColor = Color(0xFF57A5E0);