

import 'package:flutter/material.dart';

// abstract class StateInterceptor implements StateInterface {
//
// }


/// 页面状态视图
abstract class StateInterface {

  /// 错误
  Widget? error(Function onTap);

  /// 空
  Widget? empty(Function onTap);

  /// 加载
  Widget? get load;

  /// 导航栏
  Widget? get navigation;

  /// 底部导航栏
  Widget? get bottomNavigation;

  /// 背景颜色
  Color? get backgroundColor;
}