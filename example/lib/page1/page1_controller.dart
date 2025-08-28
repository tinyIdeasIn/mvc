import 'package:flutter_mvc/flutter_mvc.dart';
import 'page1_model.dart';

/// create at: 2025-08-28:14:06
/// describe：
/// author: 10456


class Page1Controller extends BaseController<Page1Model> {
  @override
  Page1Model model = Page1Model();

  @override
  void initRouteArguments() {

    print(getArgument('id'));
    super.initRouteArguments();
  }

}