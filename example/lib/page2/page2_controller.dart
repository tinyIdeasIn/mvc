import 'package:example/page3/page3_page.dart';
import 'package:flutter_mvc/flutter_mvc.dart';
import 'page2_model.dart';

/// create at: 2024-10-28:16:49
/// describe：
/// author: 10456


class Page2Controller extends BaseController<Page2Model> {
  @override
  Page2Model model = Page2Model();

  @override
  // TODO: implement content
  bool get content => true;

  @override
  void initRouteArguments() {
    super.initRouteArguments();
    print("init: ${getArgument("count")}");
  }

  void onClick(){
    push(Page3Page(), arguments: {'dd': 11});
  }
}