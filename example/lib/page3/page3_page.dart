import 'package:flutter/material.dart';
import 'package:flutter_mvc/flutter_mvc.dart';

import 'page3_controller.dart';

/// create at: 2024-10-28:16:49
/// describe：
/// author: 10456

class Page3Page extends StatefulWidget {
  const Page3Page({super.key});

  @override
  State<StatefulWidget> createState() => _Page3PageState();
}

class _Page3PageState extends BasePageState<Page3Page, Page3Controller> {

  @override
  Page3Controller controller = Page3Controller();

  @override
  Widget get content {
    return Container(
      child: Column(
        children: [
          TextButton(onPressed: (){
            // context.go('/page2', extra: {'count': 222});
            controller.onClick();
          }, child: Text(' pop page 1')),
        ],
      ),
    );
  }
}

