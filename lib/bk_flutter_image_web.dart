import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class BkFlutterImageImpl extends StatefulWidget {
  const BkFlutterImageImpl({
    Key? key,
    required this.url,
    this.placeholder,
    this.width,
    this.height,
    this.fit = BoxFit.none,
    this.autoResize = true,
    this.cacheWidth,
    this.cacheHeight,
    this.imageErrorBuilder,
  }) : super(key: key);

  static void registerWith(dynamic registrar) {}

  final String url; // 图片web地址
  final double? width; // 组件宽度
  final double? height; // 组件高度
  final String? placeholder;
  final BoxFit fit; // 图片显示模式
  final bool autoResize; // 是否下采样图片大小
  final double? cacheWidth; // 下采样的宽度
  final double? cacheHeight; // 下采样的高度
  final ImageErrorWidgetBuilder? imageErrorBuilder;

  @override
  State<StatefulWidget> createState() => _BkFlutterImageState();

  static void setCacheMaxSize(double diskMaxSize, double memoryMaxSize) {}
}

class _BkFlutterImageState extends State<BkFlutterImageImpl> {
  Uint8List? bytes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadImage();
  }

  Future<void> loadImage() async {
    bytes = await getImage(url: widget.url);
    if (bytes != null) {
      setState(() {});
    }
  }

  //获取图片的data
  static Future<Uint8List?> getImage({
    required String url,
  }) async {
    if (url.contains('http')) {
      return html.HttpRequest.request(url,
              method: 'get', responseType: 'arraybuffer')
          .then((xhr) async {
        if (xhr.response != null) {
          final ByteBuffer bb = xhr.response;
          // return base64Encode(bb.asUint8List());

          return bb.asUint8List();
        }
        return null;
      }).onError((error, stackTrace) {
        return null;
      });
    } else {
      return null;
    }
  }

  Widget getImageForData() {
    return Image.memory(
      bytes!,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      gaplessPlayback: true,
      cacheWidth: widget.cacheWidth?.toInt(),
      cacheHeight: widget.cacheHeight?.toInt(),
      errorBuilder: widget.imageErrorBuilder,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        }
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return bytes == null
        ? Container(
            width: widget.width,
            height: widget.height,
            color: Colors.grey.withOpacity(0.2),
          )
        : getImageForData();
  }
}

logger(dynamic msg) {
  assert(() {
    debugPrint('[DEBUG] # $msg');
    return true;
  }());
}
