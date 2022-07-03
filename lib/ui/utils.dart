import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:news_test_app/=models=/news.dart';

String stripHtmlTags(String text) {
  final _text = text.replaceAll('<br />', ' ');
  var doc = parse(_text);
  if (doc.documentElement != null) {
    return doc.documentElement!.text;
  }
  return '';
}

extension FormattedDateTime on News {
  String formattedDateTime() {
    String newsDateTime;
    try {
      final _dateTime = DateTime.parse(dateTime);
      newsDateTime = DateFormat('dd/MM/yyyy  HH:mm').format(_dateTime);
    } catch (e) {
      newsDateTime = dateTime;
    }
    return newsDateTime;
  }
}

String heroNewsImageTag(int id) => 'image_$id';
String heroNewsTitleTag(int id) => 'title_$id';
