import 'package:flutter_mvc/flutter_mvc.dart';
import 'package:go_router/go_router.dart';
import 'page1_model.dart';

/// create at: 2024-10-28:16:49
/// describe：
/// author: 10456

class Page1Controller extends BaseController<Page1Model> {
  @override
  Page1Model model = Page1Model();

  @override
  // TODO: implement content
  bool get content => true;

  @override
  void widgetDidLoad() {
    super.widgetDidLoad();
    print(getArgument("key1"));
    var dd = GoRouterState.of(context).extra;
    print("context111:  ${identityHashCode(context)}");
    print("aaaaa: ${dd}");
  }

  @override
  void initRouteArguments() {
    super.initRouteArguments();
    print("init: ${getArgument("key1")}");
  }
}
