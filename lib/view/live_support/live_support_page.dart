import 'package:ecom_matrix/widget/loder_widget.dart';
import 'package:flutter/material.dart';

class LiveSupportPage extends StatelessWidget {
  const LiveSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: LoaderWidget.messageLoad(child: Container(), isLoading: true),
    );
  }
}
