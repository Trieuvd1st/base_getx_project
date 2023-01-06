import 'package:base_getx_project/ui/widget/app_bar.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppbar,
      body: Column(
        children: [
          Text("123")
        ],
      ),
    );
  }

}