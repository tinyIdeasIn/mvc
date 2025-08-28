import 'package:example/page1/page1_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvc/flutter_mvc.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

/// create at: 2025-08-28:14:05
/// describe：
/// author: 10456

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage, HomeController> {
  @override
  HomeController controller = HomeController();

  @override
  Widget get content {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Get.to(Page1Page(), arguments: {"id": 123});
          },
          child: Text('to page1'),
        ),
      ],
    );
  }
}
