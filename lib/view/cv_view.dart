import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'package:zetah_cv/utils/app_colors.dart';

class CvView extends StatefulWidget {
  const CvView({super.key});

  @override
  State<CvView> createState() => _CvViewState();
}

class _CvViewState extends State<CvView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: const Text("CV Johan Sebastian Castro"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SfPdfViewer.asset("assets/cv.pdf"),
      ),
    );
  }
}