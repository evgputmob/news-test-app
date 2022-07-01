// String stripHtmlTags(String text) {
//   return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '');
// }

import 'package:html/parser.dart';

String stripHtmlTags(String text) {
  final _text = text.replaceAll('<br />', ' ');
  var doc = parse(_text);
  if (doc.documentElement != null) {
    String parsedstring = doc.documentElement!.text;
    return parsedstring;
    //output without space: HelloThis is fluttercampus.com,Bye!
  }
  return '';
}
