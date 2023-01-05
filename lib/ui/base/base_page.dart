import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class BasePage<C extends GetxController> extends StatelessWidget {
  BasePage(C initController) : _initController = initController;

  final C _initController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<C>(
      builder: (controller) => builder(context, controller),
      init: _initController,
      initState: initState,
      dispose: dispose,
      didUpdateWidget: didUpdateWidget,
      didChangeDependencies: didChangeDependencies,
    );
  }

  @protected
  Widget builder(BuildContext context, C controller);

  @protected
  void initState(GetBuilderState<C> state) {}

  @protected
  void dispose(GetBuilderState<C> state) {}

  @protected
  void didUpdateWidget(GetBuilder oldWidget, GetBuilderState<C> state) {}

  @protected
  void didChangeDependencies(GetBuilderState<C> state) {}
}

abstract class BaseStatefulPage extends StatefulWidget {}

abstract class BaseStatefulPageState<C extends GetxController>
    extends State<BaseStatefulPage>  {
  BaseStatefulPageState(C initController)
      : _initController = initController;

  final C _initController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<C>(
      builder: (c) => builder(c),
      init: _initController,
    );
  }

  @protected
  Widget builder(C controller);
}

abstract class BaseStatelessPage extends StatelessWidget {
  const BaseStatelessPage({super.key});
}