import 'package:flutter/material.dart';
import 'package:flutter_mvc/flutter_mvc.dart';
import 'package:go_router/go_router.dart';

import 'page1_controller.dart';

/// create at: 2024-10-28:16:49
/// describe：
/// author: 10456

class Page1Page extends StatefulWidget {
  const Page1Page({super.key});

  @override
  State<StatefulWidget> createState() => _Page1PageState();
}

class _Page1PageState extends BasePageState<Page1Page, Page1Controller> {

  @override
  Page1Controller controller = Page1Controller();

  @override
  Widget get content {
    return Container(
      child: Column(
        children: [
          TextButton(onPressed: (){
            context.go('/page2', extra: {'count': 222});
          }, child: Text(' to page2 ')),

          TextButton(onPressed: (){
            // context.go('/page2', extra: {'count': 222});
            controller.pop();
          }, child: Text(' pop ')),
        ],
      ),
    );

  }
}

