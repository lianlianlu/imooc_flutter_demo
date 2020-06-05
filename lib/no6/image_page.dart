import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// new Image - 从ImageProvider获取图像
/// new Image.asset -
/// new Image.network - 从URL中获取图片
/// new Image.file - 从本地文件中获取图片
/// new Image.memory - 从Uint8List获取图像
/// 在加载项目中的资源时，为了让Image能够根据像素密度自动适配不同分辨率的图片，请使用AssetImage指定图像，并确保在widget树中的"image" widget上方存在
/// MaterialAPP, WidgetsApp, MediaQuery窗口
///
/// 设置Placeholder
class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '图片',
      home: Scaffold(
          appBar: AppBar(
            title: Text('图片设置'),
            leading: BackButton(),
          ),
          body: Column(
            children: [
              Stack(
                children: [
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                  Center(
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: 'https://picsum.photos/250?image=9',
                    ),
                  )
                ],
              ),
              CachedNetworkImage(
                //断网之后能拿到图片
                imageUrl: "https://picsum.photos/250?image=9",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
//              CachedNetworkImage(
//                imageUrl: "https://picsum.photos/250?image=9",
//                progressIndicatorBuilder: (context, url, downloadProgress) =>
//                    CircularProgressIndicator(value: downloadProgress.progress),
//                errorWidget: (context, url, error) => Icon(Icons.error),
//              ),
//              CachedNetworkImage(
//                imageUrl: "https://picsum.photos/250?image=9",
//                imageBuilder: (context, imageProvider) => Container(
//                  decoration: BoxDecoration(
//                    image: DecorationImage(
//                        image: imageProvider,
//                        fit: BoxFit.cover,
//                        colorFilter:
//                            ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
//                  ),
//                ),
//                placeholder: (context, url) => CircularProgressIndicator(),
//                errorWidget: (context, url, error) => Icon(Icons.error),
//              ),
            ],
          )),
    );
  }
}
