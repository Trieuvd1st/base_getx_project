import 'dart:async';
import 'package:base_getx_project/util/widget_util.dart';
import 'package:flutter/material.dart';
import 'dsl/when.dart';

void toast(String msg,
    {int? duration, double? margin, ToastAlign align = ToastAlign.bottom}) {
  _toastKey.currentState
      ?.showToast(msg, duration: duration, margin: margin, align: align);
}

GlobalKey<_ToastState> _toastKey = GlobalKey<_ToastState>();

class Toast extends StatefulWidget {
  Toast() : super(key: _toastKey);

  @override
  _ToastState createState() => _ToastState();
}

class _ToastState extends State<Toast> with WidgetsBindingObserver {
  String? _msg;
  bool _visible = false;
  Timer? _timer;
  var _topPadding = 0.0;
  var _bottomPadding = 0.0;
  double? _margin;
  ToastAlign _align = ToastAlign.bottom;

  @override
  void didChangeMetrics() {
    final flutterWindow = WidgetsBinding.instance?.window;
    if (flutterWindow != null) {
      final viewInsets = MediaQueryData.fromWindow(flutterWindow).viewInsets;
      setState(() {
        _topPadding = viewInsets.top;
        _bottomPadding = viewInsets.bottom;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  void showToast(String msg,
      {int? duration, double? margin, ToastAlign align = ToastAlign.bottom}) {
    _timer?.cancel();
    setState(() {
      _align = align;
      _msg = msg;
      _margin = margin;
      _visible = true;
    });
    _timer = Timer(Duration(seconds: duration ?? 3), () {
      setState(() {
        _visible = false;
      });
      _timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    final top = When<ToastAlign, double?>(_align)
        .eq(ToastAlign.top, (obj) => _margin ?? 44 + _topPadding)
        .eq(ToastAlign.center, (obj) => null)
        .eq(ToastAlign.bottom, (obj) => null)
        .get();
    final bottom = When<ToastAlign, double?>(_align)
        .eq(ToastAlign.top, (obj) => null)
        .eq(ToastAlign.center, (obj) => null)
        .eq(ToastAlign.bottom, (obj) => _margin ?? 44 + _bottomPadding)
        .get();
    return [
      AnimatedOpacity(
        opacity: _visible ? 1 : 0,
        duration: Duration(milliseconds: 300),
        child: Container(
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6), color: Colors.grey),
            child: Text(
              _msg ?? '',
              style: TextStyle(color: Colors.white, fontSize: 14),
            )),
      ).intrinsicWidth().positioned(
        top: top,
        bottom: bottom,
        left: 16,
        right: 16,
      )
    ]
        .asStack(alignment: Alignment.center)
        .directionality(TextDirection.ltr)
        .ignorePointer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }
}

extension ToastExt on Object {
  void toastIt() => toast(this.toString());
}

enum ToastAlign {
  top,
  center,
  bottom,
}
