import 'package:flutter/material.dart';
import 'package:flutter_mvc/flutter_mvc.dart';

import 'page2_controller.dart';

/// create at: 2024-10-28:16:49
/// describe：
/// author: 10456

class Page2Page extends StatefulWidget {
  const Page2Page({super.key});

  @override
  State<StatefulWidget> createState() => _Page2PageState();
}

class _Page2PageState extends BasePageState<Page2Page, Page2Controller> {

  @override
  Page2Controller controller = Page2Controller();

  @override
  Widget get content {
    return Container(
      child: Column(
        children: [
          TextButton(onPressed: (){
            // context.go('/page2', extra: {'count': 222});
            controller.onClick();
          }, child: Text(' to page3 ')),

          TextButton(onPressed: (){
            // context.go('/page2', extra: {'count': 222});
            controller.pop();
          }, child: Text(' pop ')),
        ],
      ),
    );
  }
}

