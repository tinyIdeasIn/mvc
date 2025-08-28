import 'package:flutter_mvc/flutter_mvc.dart';
import 'package:flutter/material.dart';
import 'page1_controller.dart';

/// create at: 2025-08-28:14:06
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
    return Container(color: Colors.blue);
  }
}

