import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_document_scanner/flutter_document_scanner.dart';
import 'package:path_provider/path_provider.dart';

class DocumentScannerView extends StatelessWidget {
  DocumentScannerView({super.key});
  final controller = DocumentScannerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DocumentScanner(cropPhotoDocumentStyle: CropPhotoDocumentStyle(
          top: MediaQuery.of(context).padding.top,
        ),
          resolutionCamera: ResolutionPreset.ultraHigh,
          onSave: (Uint8List imageBytes) async {
            Directory? dir = await getDownloadsDirectory();
            File("${dir!.path}/scanned.jpeg").writeAsBytes(imageBytes);
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder:
                  (_) => AlertDialog(content: Text("Saved at ${dir.path}")),
            );
          },
        ),
      ),
    );
  }
}
