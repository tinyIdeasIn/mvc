import 'package:flutter_mvc/flutter_mvc.dart';
import 'home_model.dart';

/// create at: 2025-08-28:14:05
/// describe：
/// author: 10456


class HomeController extends BaseController<HomeModel> {
  @override
  HomeModel model = HomeModel();

  @override
  bool get content => true;
}