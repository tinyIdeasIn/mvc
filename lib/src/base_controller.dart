import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

import 'base.dart';
import 'base_model.dart';

abstract class BaseController<T extends BaseModel> extends ChangeNotifier
    implements
        BaseControllerState,
        BaseControllerLifeCycle,
        BaseOverrideController<T>,
        BaseControllerCommonMethod {
  /// 当前页面上下文
  late BuildContext context;

  /// 是否加载中
  @override
  bool get loading => isLoadFirst;

  /// 是否页面错误
  @override
  bool get error => isLoadError;

  /// 是否空页面
  @override
  bool get empty => false;

  /// 是否正常显示内容
  @override
  bool get content => false;

  /// 是否需要控制点击屏幕任意位置 隐藏键盘
  bool get isHideKeyboard => true;

  /// 是否第一次加载
  bool isLoadFirst = true;

  /// 是否加载错误
  bool isLoadError = false;

  /// 视图渲染完成(只调用一次)
  @override
  void widgetDidLoad() {
    initRouteArguments();
  }

  /// 视图销毁
  @override
  void widgetDispose() {}

  /// 页面开始加载(只调用一次)
  @override
  void initLoad() {}

  /// 初始化路由参数
  @override
  void initRouteArguments() {}

  /// 隐藏键盘
  @override
  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  /// 屏幕点击
  @override
  void onScreenClick() {
    if (isHideKeyboard) hideKeyboard();
  }

  /// 点击重新请求
  void loadRetry() {}
}

extension Common on BaseController {
  /// 获取页面状态
  PageStateType get switchState {
    if (content) {
      if (isLoadFirst) isLoadFirst = false;
      return PageStateType.content;
    }
    if (loading) {
      isLoadFirst = false;
      return PageStateType.loading;
    }
    if (error) return PageStateType.error;
    if (empty) return PageStateType.empty;
    return PageStateType.content;
  }

  /// @title getArgument
  /// @description 获取路由参数
  /// @param: key
  /// @param: defaultValue 默认值
  /// @return T?
  /// @updateTime 2022/1/27 10:24 上午
  /// @author 10456
  T? getArgument<T>(Object key, {T? defaultValue}) {
    try {
      var arguments = GoRouterState.of(context).extra;
      if(arguments == null || (arguments is Map && arguments.isEmpty)){
        arguments = ModalRoute.of(context)?.settings.arguments;
      }
      if (arguments == null) return defaultValue;
      if (arguments is Map) {
        final value = arguments[key];
        if (value == null) return defaultValue;
        return value;
      }
      return defaultValue;
    } catch (e) {
      try{
        var arguments = ModalRoute.of(context)?.settings.arguments;
        if (arguments == null) return defaultValue;
        if (arguments is Map) {
          final value = arguments[key];
          if (value == null) return defaultValue;
          return value;
        }
        return defaultValue;
      } catch(e){
        return defaultValue;
      }
      return defaultValue;
    }
  }

  T? getRouteArgument<T>(Object key, {T? defaultValue}) {
    try {
      var arguments =  ModalRoute.of(context)?.settings.arguments;
      if (arguments == null) return defaultValue;
      if (arguments is Map) {
        final value = arguments[key];
        if (value == null) return defaultValue;
        return value;
      }
      return defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }
}

extension Route on BaseController {
  /// @title push
  /// @description 路由切换页面
  /// @param: page 页面
  /// @param: arguments 参数
  /// @param: isReplace 是否替换当前页面
  /// @param: type 切换动画类型
  /// @param: isRemoveUntil  是否删除当前页面
  /// @return Future<Object?>
  /// @updateTime 2022/1/27 10:25 上午
  /// @author 10456
  Future<dynamic>? push(
    Widget page, {
    dynamic arguments,
    bool isReplace = false,
    String? routeName,
  }) {
    if (isReplace) {
      return Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    } else {
      return Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    }
  }

  /// @title pop
  /// @description 返回指定页面(默认返回上级页面)
  /// @param: type 指定页面
  /// @param: result 返回参数
  /// @return void
  /// @updateTime 2022/1/27 10:26 上午
  /// @author 10456
  void pop<T>({type, T? result}) {
    if(type != null) {
      final navigator = GoRouter.of(context).routerDelegate.navigatorKey.currentState;
      navigator?.popUntil((route){
        return route.settings.name == type;
      });
    } else {
      context.pop(result);
    }
  }
}

extension Load on BaseController {
  ///隐藏加载圈
  void hideLoading() {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  }

  ///显示加载圈
  void showLoading({message = '加載中...'}) {
    if (!EasyLoading.isShow) {
      EasyLoading.show(status: message);
    }
  }

  ///显示提示
  void toast(String message,
      {EasyLoadingToastPosition position = EasyLoadingToastPosition.center}) {
    EasyLoading.showToast(message, toastPosition: position);
  }
}
