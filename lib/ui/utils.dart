import 'package:html/parser.dart';

String stripHtmlTags(String text) {
  final _text = text.replaceAll('<br />', ' ');
  var doc = parse(_text);
  if (doc.documentElement != null) {
    return doc.documentElement!.text;
  }
  return '';
}
