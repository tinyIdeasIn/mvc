import 'package:flutter_mvc/flutter_mvc.dart';
import 'package:flutter/material.dart';
import 'page2_controller.dart';

/// create at: 2025-08-28:14:07
/// describe：
/// author: 10456

class Page2Page extends StatefulWidget {
  const Page2Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Page2PageState();
}

class _Page2PageState extends BasePageState<Page2Page, Page2Controller> {

  @override
  Page2Controller controller = Page2Controller();

  @override
  Widget get content {
    return Container(color: Colors.blue);
  }
}

