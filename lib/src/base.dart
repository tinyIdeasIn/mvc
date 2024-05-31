
import 'package:flutter/material.dart';
import 'base_controller.dart';
import 'base_model.dart';


/// 页面加载状态类型
enum PageStateType {
  /// 加载中
  loading,

  /// 空数据页面
  empty,

  /// 错误页面
  error,

  /// 真实数据内容
  content,
}

/// 控制器
abstract class BaseOverrideStatePage<T extends BaseController> {

  late T controller;
}

/// model
abstract class BaseOverrideController<T extends BaseModel> {

  late T model;
}

/// 页面加载状态
abstract class BaseControllerState {
  /// 是否展示加载布局
  bool get loading;

  /// 是否显示错误布局
  bool get error;

  /// 是否显示空布局
  bool get empty;

  /// 是否显示主内容
  bool get content;
}


/// 页面加载周期
abstract class BaseControllerLifeCycle {
  /// 开始加载
  void initLoad();

  /// 页面初始化完毕
  void widgetDidLoad();

  /// 页面销毁
  void widgetDispose();
}


/// 控制器常用方法
abstract class BaseControllerCommonMethod {

  /// 初始路由参数
  void initRouteArguments();

  /// 隐藏键盘
  void hideKeyboard();

  /// 页面body任意位置点击
  void onScreenClick();
}

/// 页面状态视图
abstract class PageInterface {

  /// 内容
  Widget get content;

  /// 错误
  Widget get error;

  /// 空
  Widget get empty;

  /// 加载
  Widget get load;

  /// 导航栏
  Widget? get navigation;

  /// 底部导航栏
  Widget? get bottomNavigation;

  /// 主体
  Widget get body;
}