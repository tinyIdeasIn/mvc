import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'base.dart';
import 'base_controller.dart';
import 'base_state_widget.dart';
import 'mvc_manager.dart';
import 'navigation_bar.dart';

abstract class BasePage<T extends BaseController> extends StatelessWidget
    implements PageInterface {
  late T controller;

  BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    controller.context = context;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: style,
      child: ChangeNotifierProvider.value(
        value: controller,
        child: Consumer<T>(
          builder: (context, controller, _) {
            return renderLayout;
          },
        ),
      ),
    );
  }

  @override
  Widget get body {
    switch (controller.switchState) {
      case PageStateType.content:
        return content;
      case PageStateType.error:
        return error;
      case PageStateType.empty:
        return empty;
      case PageStateType.loading:
        return load;
      default:
        return content;
    }
  }

  @override
  Widget get empty {
    return MvcManager().interceptor?.empty(controller.loadRetry) ??
        PageStateEmpty(onRetry: controller.loadRetry);
  }

  @override
  Widget get error {
    return MvcManager().interceptor?.error(controller.loadRetry) ??
        PageStateRequestError(
          onRetry: controller.loadRetry,
        );
  }

  @override
  Widget get load => MvcManager().interceptor?.load ?? const PageStateLoad();

  @override
  Widget? get navigation => MvcManager().interceptor?.navigation ?? NavBar();

  @override
  Widget? get bottomNavigation => MvcManager().interceptor?.bottomNavigation;

  Color get backgroundColor =>
      MvcManager().interceptor?.backgroundColor ?? Colors.white;

  bool get extendBodyBehindAppBar => false;

  /// 状态栏颜色
  SystemUiOverlayStyle get style => SystemUiOverlayStyle.dark;

  Widget get renderLayout {
    return GestureDetector(
      onTap: controller.onScreenClick,
      child: Scaffold(
        backgroundColor: backgroundColor,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        appBar: navigation as PreferredSizeWidget?,
        body: body,
      ),
    );
  }
}
