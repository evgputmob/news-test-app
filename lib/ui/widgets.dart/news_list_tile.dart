import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_test_app/=models=/news.dart';
import 'package:news_test_app/ui/utils.dart';

class NewsListTile extends StatelessWidget {
  final News news;

  const NewsListTile({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imgUrl = news.previewPath ?? '';

    const clrLightGrey = 0xFFE0E0E0;
    const clrLightPink = 0xFFFCE4EC;
    const previewImgSideSize = 64.0;

    const iconNewspaper = SizedBox(
      width: previewImgSideSize,
      height: previewImgSideSize,
      child: Center(
        child: Icon(Icons.newspaper,
            size: previewImgSideSize, color: Color(clrLightGrey)),
      ),
    );

    const iconError = SizedBox(
      width: previewImgSideSize,
      height: previewImgSideSize,
      child: Center(
        child: Icon(Icons.error,
            size: previewImgSideSize, color: Color(clrLightPink)),
      ),
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 6, 4, 6),
      child: ListTile(
        onTap: () => {},
        leading: imgUrl.isEmpty
            ? iconNewspaper
            : CachedNetworkImage(
                imageUrl: imgUrl,
                width: previewImgSideSize,
                height: previewImgSideSize,
                placeholder: (_, __) => iconNewspaper,
                errorWidget: (_, __, ___) => iconError,
              ),
        title: Text(
          news.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          stripHtmlTags(news.text).trim(),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
