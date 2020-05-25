import 'package:flutter/material.dart';
import 'package:unasp_ht/app/pages/home/models/news_model.dart';

class NewsDetailsPage extends StatelessWidget {
  final News model;

  const NewsDetailsPage({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model?.title ?? ''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: model?.title,
              child: Image.network(
                model?.image ?? '',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(model?.text),
            )
          ],
        ),
      ),
    );
  }
}
