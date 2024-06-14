import 'package:ecom_matrix/widget/loder_widget.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: LoaderWidget(child: Container(), isLoading: true),
    );
  }
}
