import 'package:bk_flutter_image/bk_flutter_image.dart';
import 'package:flutter/material.dart';

import 'exts.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double width = 300;
  double height = 300;
  BoxFit fit = BoxFit.cover;
  bool useFlutterImage = true;
  String imageUrl =
      'https://p9.itc.cn/images01/20200624/ea051d6190c34123a4faf0eedcc70f16.jpeg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter 使用原生image view'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                // Navigator.push(
                //     context,
                //     DialogRoute(
                //         context: context,
                //         builder: (c) {
                //           return GridListDemo();
                //         }));
                Navigator.push(context, MaterialPageRoute(builder: (c) {
                  return GridListDemo();
                }));
              })
        ],
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Text('flutter这边的图片container参数设置'),
                Row(
                  children: <Widget>[
                    Text('flutter上的宽度'),
                    Slider(
                        value: width,
                        min: 100,
                        max: 500,
                        onChanged: (value) {
                          setState(() {
                            width = value.roundToDouble();
                          });
                        }),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('flutter上的高度'),
                    Slider(
                        value: height,
                        min: 100,
                        max: 500,
                        onChanged: (value) {
                          setState(() {
                            height = value.roundToDouble();
                          });
                        }),
                  ],
                ),
                // Row(
                //   children: <Widget>[
                //     Text('使用Texture加载图片: $useFlutterImage'),
                //     Checkbox(
                //       value: useFlutterImage,
                //       onChanged: (value) {
                //         setState(() {
                //           useFlutterImage = value!;
                //         });
                //       },
                //     ),
                //     Text('Cover:'),
                //     Checkbox(
                //       value: fit == BoxFit.cover,
                //       onChanged: (value) {
                //         setState(() {
                //           fit = value == true ? BoxFit.cover : BoxFit.none;
                //         });
                //       },
                //     ),
                //     Text('Contain:'),
                //     Checkbox(
                //       value: fit == BoxFit.contain,
                //       onChanged: (value) {
                //         setState(() {
                //           fit = value == true ? BoxFit.contain : BoxFit.none;
                //         });
                //       },
                //     ),
                //     Text('fill:'),
                //     Checkbox(
                //       value: fit == BoxFit.fill,
                //       onChanged: (value) {
                //         setState(() {
                //           fit = value == true ? BoxFit.fill : BoxFit.none;
                //         });
                //       },
                //     ),
                //     Text('fitWidth:'),
                //     Checkbox(
                //       value: fit == BoxFit.fitWidth,
                //       onChanged: (value) {
                //         setState(() {
                //           fit = value == true ? BoxFit.fitWidth : BoxFit.none;
                //         });
                //       },
                //     ),
                //     Text('fitHeight:'),
                //     Checkbox(
                //       value: fit == BoxFit.fitHeight,
                //       onChanged: (value) {
                //         setState(() {
                //           fit = value == true ? BoxFit.fitHeight : BoxFit.none;
                //         });
                //       },
                //     ),
                //     Text('scale:'),
                //     Checkbox(
                //       value: fit == BoxFit.scaleDown,
                //       onChanged: (value) {
                //         setState(() {
                //           fit = value == true ? BoxFit.scaleDown : BoxFit.none;
                //         });
                //       },
                //     ),
                //   ],
                // ),

                Wrap(
                  children: [
                    Text('使用Texture加载图片: $useFlutterImage'),
                    Checkbox(
                      value: useFlutterImage,
                      onChanged: (value) {
                        setState(() {
                          useFlutterImage = value!;
                        });
                      },
                    ),
                    Text('Cover:'),
                    Checkbox(
                      value: fit == BoxFit.cover,
                      onChanged: (value) {
                        setState(() {
                          fit = value == true ? BoxFit.cover : BoxFit.none;
                        });
                      },
                    ),
                    Text('Contain:'),
                    Checkbox(
                      value: fit == BoxFit.contain,
                      onChanged: (value) {
                        setState(() {
                          fit = value == true ? BoxFit.contain : BoxFit.none;
                        });
                      },
                    ),
                    Text('fill:'),
                    Checkbox(
                      value: fit == BoxFit.fill,
                      onChanged: (value) {
                        setState(() {
                          fit = value == true ? BoxFit.fill : BoxFit.none;
                        });
                      },
                    ),
                    Text('fitWidth:'),
                    Checkbox(
                      value: fit == BoxFit.fitWidth,
                      onChanged: (value) {
                        setState(() {
                          fit = value == true ? BoxFit.fitWidth : BoxFit.none;
                        });
                      },
                    ),
                    Text('fitHeight:'),
                    Checkbox(
                      value: fit == BoxFit.fitHeight,
                      onChanged: (value) {
                        setState(() {
                          fit = value == true ? BoxFit.fitHeight : BoxFit.none;
                        });
                      },
                    ),
                    Text('scale:'),
                    Checkbox(
                      value: fit == BoxFit.scaleDown,
                      onChanged: (value) {
                        setState(() {
                          fit = value == true ? BoxFit.scaleDown : BoxFit.none;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: SafeArea(
              child: Column(children: [
                Container(
                  // width: 400,
                  // height: 100,
                  // child: useFlutterImage
                  //     ? BkFlutterImage(
                  //         url: imageUrl,
                  //         height: height,
                  //         width: width,
                  //         fit: fit,
                  //       )
                  //     : Image.network(
                  //         imageUrl,
                  //         fit: fit,
                  //         width: width,
                  //         height: height,
                  //       ),
                  child: BkFlutterImage(
                    url: imageUrl,
                    height: height,
                    width: width,
                    fit: fit,
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
