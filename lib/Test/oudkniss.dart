import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ouedkniss extends StatefulWidget {
  const ouedkniss({Key? key}) : super(key: key);

  @override
  _ouedknissState createState() => _ouedknissState();
}

class _ouedknissState extends State<ouedkniss> {
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    getWebsiteData();
  }

  Future getWebsiteData() async {
    final url = Uri.parse('https://www.amazon.com/s?k=gaming+keyboard');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final titles = html
        .querySelectorAll('h2 > a > span')
        .map((element) => element.innerHtml.trim())
        .toList();

    final urls = html
        .querySelectorAll('h2 > a')
        .map((e) => 'https://www.amazon.com/${e.attributes['href']}')
        .toList();

    final urlImages = html
        .querySelectorAll('span > a > div > img')
        .map((e) => e.attributes['src']!)
        .toList();

    print('Count:${titles.length}');

    setState(() {
      articles = List.generate(
          titles.length,
          (index) => Article(
              url: urls[index],
              title: titles[index],
              urlImage: urlImages[index]));
    });

    for (final title in titles) {
      debugPrint(title);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('web scraping'),
          centerTitle: true,
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return ListTile(
                leading: Image.network(
                  article.urlImage,
                  width: 50,
                  fit: BoxFit.fitHeight,
                ),
                title: Text(article.title),
                subtitle: Text(article.url),
              );
            }),
      );
}

class Article {
  final String url;
  final String title;
  final String urlImage;
  const Article(
      {required this.url, required this.title, required this.urlImage});
}
