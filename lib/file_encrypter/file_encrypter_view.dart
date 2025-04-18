import 'package:flutter/material.dart';

class FileEncrypterView extends StatelessWidget {
  const FileEncrypterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){}, child: Text("Pick a file")),
        ],
      ),
    );
  }
}
