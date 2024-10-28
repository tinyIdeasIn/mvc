import 'package:flutter_mvc/flutter_mvc.dart';
import 'page3_model.dart';

/// create at: 2024-10-28:16:49
/// describe：
/// author: 10456


class Page3Controller extends BaseController<Page3Model> {
  @override
  Page3Model model = Page3Model();

  @override
  // TODO: implement content
  bool get content => true;

  @override
  void initRouteArguments() {
    super.initRouteArguments();
    print("page3: ${getArgument('dd')}");
  }


  void onClick(){
    pop(type: 'page1', result: {'dd': true});
  }
}