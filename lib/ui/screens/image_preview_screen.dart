import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImagePreviewScreen extends StatelessWidget {
  static const name = 'imagepreview';
  static const path = '/imagepreview/:imagePath';

  final String imagePath;

  const ImagePreviewScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imagePath.isEmpty) {
      return const Center(child: Text('Изображение отсутствует'));
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            InteractiveViewer(
              scaleEnabled: true,
              panEnabled: true,
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: imagePath,
                  placeholder: (_, __) => const CircularProgressIndicator(),
                  errorWidget: (_, __, ___) => Icon(
                    Icons.error,
                    color: Colors.red.shade300,
                    size: 100,
                  ),
                ),
              ),
            ),
            Positioned(
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).primaryColor.withOpacity(0.7),
                  size: 36,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              top: 2,
              right: 4,
            )
          ],
        ),
      ),
    );
  }
}
