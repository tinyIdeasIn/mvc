import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_controller.dart';

abstract class BaseBottomSheetDialog<T extends StatefulWidget,
C extends BaseController> extends State<T> {
  late C controller;

  Color? get backgroundColor => Colors.grey[700];

  double get elevation => 24.0;

  RoundedRectangleBorder get dialogShape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0));

  @override
  void initState() {
    controller.initLoad();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => controller.widgetDidLoad());
    super.initState();
  }

  @override
  void dispose() {
    controller.widgetDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return renderLayout();
  }

  /// 渲染视图
  Widget renderLayout() {
    final EdgeInsets effectivePadding =
        MediaQuery.of(context).viewInsets + const EdgeInsets.all(0.0);
    return AnimatedPadding(
      padding: effectivePadding,
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 280.0),
          child: Material(
            color: backgroundColor,
            elevation: elevation,
            shape: dialogShape,
            type: MaterialType.transparency,
            clipBehavior: Clip.none,
            child: ChangeNotifierProvider.value(
              value: controller,
              child: Consumer<C>(
                builder: (context, controller, _) {
                  return content;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get content;
}
