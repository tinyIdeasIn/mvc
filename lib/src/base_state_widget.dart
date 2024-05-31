import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 网络错误
class PageStateNetWorkError extends BasePageStateWidget {
  PageStateNetWorkError({
    String? text,
    Function? onRetry,
    Object? image,
    String? path,
  }) : super(
          onRetry: onRetry,
          text: text ?? "網路不順，請檢查後再重試",
          image: Image.asset(
            "assets/placeholder_network_error.png",
            width: 300,
            height: 200,
            fit: BoxFit.contain,
            package: "ad_mvc",
          ),
        );
}

/// 请求错误
class PageStateRequestError extends BasePageStateWidget {
  PageStateRequestError({
    String? text,
    Function? onRetry,
    Object? image,
    String? path,
  }) : super(
          onRetry: onRetry,
          text: text ?? "請求錯誤，請重試",
          image: Image.asset(
            "assets/placeholder_system_error.png",
            width: 300,
            height: 200,
            fit: BoxFit.contain,
            package: "ad_mvc",
          ),
        );
}

/// 空页面
class PageStateEmpty extends BasePageStateWidget {
  PageStateEmpty({
    String? text,
    Function? onRetry,
    Object? image,
    String? path,
  }) : super(
          onRetry: onRetry,
          text: text ?? "暫無數據",
          image: Image.asset(
            "assets/placeholder_empty_data.png",
            width: 300,
            height: 200,
            fit: BoxFit.contain,
            package: "ad_mvc",
          ),
        );
}

/// 默认加载页
class PageStateLoad extends StatelessWidget {
  const PageStateLoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          indicator,
          const SizedBox(height: 20),
          const Text(
            "裝載中...",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget get indicator {
    return Platform.isIOS
        ? const CupertinoActivityIndicator(
            animating: true,
            radius: 12.0,
          )
        : const CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: AlwaysStoppedAnimation(Colors.grey),
          );
  }
}

class CommonStatePage extends StatelessWidget {
  final Widget image;
  final String text;
  final double? textSize;
  final double? width;
  final double? height;

  const CommonStatePage({
    Key? key,
    required this.image,
    this.text = "",
    this.textSize,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          image,
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              text,
              style: TextStyle(
                color: const Color(0xFF999999),
                fontSize: textSize ?? 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}

abstract class BasePageStateWidget extends StatelessWidget {
  final Function? onRetry;
  final String text;
  final Widget image;

  const BasePageStateWidget({
    key,
    required this.image,
    this.onRetry,
    this.text = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => renderLayout();

  Widget renderLayout() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: InkWell(
        onTap: () => onRetry?.call(),
        child: CommonStatePage(
          image: image,
          text: text,
        ),
      ),
    );
  }
}
