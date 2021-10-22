import 'package:flutter/material.dart';

class AppIconWidget extends StatelessWidget {
  final image;
  final Color? tinColor;
  final double? aspectSize;

  const AppIconWidget({Key? key, this.image, this.tinColor, this.aspectSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //getting screen size
    var size = MediaQuery.of(context).size;
    double? imageSize;
    //calculating container width
    if (this.aspectSize != null) {
      if (MediaQuery.of(context).orientation == Orientation.portrait) {
        imageSize = (size.width * aspectSize!);
      } else {
        imageSize = (size.height * aspectSize!);
      }
    }

    if (this.tinColor != null) {
      return Image.asset(
        image,
        height: imageSize,
        color: tinColor,
      );
    } else {
      return Image.asset(
        image,
        height: imageSize,
      );
    }
  }
}
