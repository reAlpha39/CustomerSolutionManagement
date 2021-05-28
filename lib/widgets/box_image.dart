import 'package:flutter/material.dart';

class BoxImage extends StatelessWidget {
  final String? pathPicture;

  const BoxImage({Key? key, this.pathPicture}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: pathPicture != "" && pathPicture != null
            ? Image.network(
                pathPicture!,
                loadingBuilder: (context, child, progress) {
                  return progress == null ? child : LinearProgressIndicator();
                },
                fit: BoxFit.cover,
              )
            : Image.asset(
                "assets/images/no_image.jpg",
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
