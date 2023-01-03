import 'package:flutter/widgets.dart';
import '../ui/widget/unfocus.dart';

extension WidgetExt on Widget {
  Widget container({
    Alignment? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    BoxDecoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    Clip clipBehavior = Clip.none,
  }) =>
      Container(
        alignment: alignment,
        padding: padding,
        color: color,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        width: width,
        height: height,
        constraints: constraints,
        margin: margin,
        transform: transform,
        clipBehavior: clipBehavior,
        child: this,
      );

  Widget padding(EdgeInsetsGeometry padding) =>
      Padding(padding: padding, child: this);

  Widget center() => Center(child: this);

  Widget align(Alignment alignment) => Align(alignment: alignment, child: this);

  Widget sizedBox({double? width, double? height}) =>
      SizedBox(width: width, height: height, child: this);

  Widget visibility({bool visible = true, bool needPlaceHolder = false}) =>
      Visibility(
          visible: visible,
          maintainSize: needPlaceHolder,
          maintainAnimation: needPlaceHolder,
          maintainState: needPlaceHolder,
          child: this);

  Widget offstage(bool offstage) =>
      Offstage(offstage: offstage, child: this);

  Widget opacity(double opacity) => Opacity(opacity: opacity);

  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(flex: flex, fit: fit, child: this);

  Widget positioned(
      {double? left,
        double? top,
        double? right,
        double? bottom,
        double? width,
        double? height}) =>
      Positioned(
          child: this,
          left: left,
          top: top,
          right: right,
          bottom: bottom,
          width: width,
          height: height);

  Widget onTap(VoidCallback? onTap,
      {HitTestBehavior behavior = HitTestBehavior.deferToChild}) =>
      GestureDetector(behavior: behavior, onTap: onTap, child: this);

  Widget ignorePointer({bool ignoring = true}) =>
      IgnorePointer(ignoring: ignoring, child: this);

  Widget intrinsicHeight() => IntrinsicHeight(child: this);

  Widget intrinsicWidth() => IntrinsicWidth(child: this);

  Widget fittedBox({
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
    Clip clipBehavior = Clip.hardEdge,
  }) =>
      FittedBox(
          fit: fit,
          alignment: alignment,
          clipBehavior: clipBehavior,
          child: this);

  Widget willPopScope(WillPopCallback onWillPop) =>
      WillPopScope(child: this, onWillPop: onWillPop);

  Widget safeArea({
    bool left = true,
    bool top = true,
    bool right = true,
    bool bottom = true,
    EdgeInsets minimum = EdgeInsets.zero,
    bool maintainBottomViewPadding = false,
  }) =>
      SafeArea(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
          minimum: minimum,
          maintainBottomViewPadding: maintainBottomViewPadding,
          child: this);

  Widget directionality(TextDirection textDirection) =>
      Directionality(textDirection: textDirection, child: this);

  Widget unfocus() => Unfocus(child: this);
}

extension WidgetListExt on List<Widget> {
  Column asColumn(
      {MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
        MainAxisSize mainAxisSize = MainAxisSize.max,
        CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
        TextDirection? textDirection,
        VerticalDirection verticalDirection = VerticalDirection.down,
        TextBaseline? textBaseline}) =>
      Column(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: this,
      );

  Row asRow(
      {MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
        MainAxisSize mainAxisSize = MainAxisSize.max,
        CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
        TextDirection? textDirection,
        VerticalDirection verticalDirection = VerticalDirection.down,
        TextBaseline textBaseline = TextBaseline.alphabetic}) =>
      Row(
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          textBaseline: textBaseline,
          children: this);

  Stack asStack(
      {AlignmentGeometry alignment = AlignmentDirectional.topStart,
        TextDirection? textDirection,
        StackFit fit = StackFit.loose,
        Clip clipBehavior = Clip.hardEdge}) =>
      Stack(
          alignment: alignment,
          textDirection: textDirection,
          fit: fit,
          clipBehavior: clipBehavior,
          children: this);
}

extension SliverWidgetExt on Widget {
  Widget sliverPadding(EdgeInsetsGeometry padding) =>
      SliverPadding(padding: padding, sliver: this);

  Widget sliverVisibility(
      {bool visible = true, bool needPlaceHolder = false}) =>
      SliverVisibility(
          visible: visible,
          maintainSize: needPlaceHolder,
          maintainAnimation: needPlaceHolder,
          maintainState: needPlaceHolder,
          sliver: this);

  Widget sliverOffstage(bool offstage) =>
      SliverOffstage(offstage: offstage, sliver: this);

  Widget sliverOpacity({double opacity = 1.0}) =>
      SliverOpacity(opacity: opacity, sliver: this);

  Widget sliverIgnorePointer({bool ignoring = true}) =>
      SliverIgnorePointer(ignoring: ignoring, sliver: this);

  Widget sliverFillRemaining({
    bool hasScrollBody = true,
    bool fillOverscroll = false,
  }) =>
      SliverFillRemaining(
          child: this,
          hasScrollBody: hasScrollBody,
          fillOverscroll: fillOverscroll);

  Widget sliverSafeArea({
    bool left = true,
    bool top = true,
    bool right = true,
    bool bottom = true,
    EdgeInsets minimum = EdgeInsets.zero,
  }) =>
      SliverSafeArea(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
          minimum: minimum,
          sliver: this);

  Widget toSliver() => SliverToBoxAdapter(child: this);
}
