import 'package:base_getx_project/res/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class _BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Visibility(
        visible: ModalRoute.of(context)?.canPop ?? false,
        child: TextButton(
          onPressed: () => Navigator.of(context).maybePop(),
          child: SvgPicture.asset(Images.icBack),
        ),
      ),
    );
  }
}

final transparentAppbar = AppBar(leading: _BackButton(), backgroundColor: Colors.transparent,);
