import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unasp_ht/app/pages/home/home_bloc.dart';
import 'package:unasp_ht/app/pages/home/home_module.dart';
import 'package:unasp_ht/app/pages/home/models/news_model.dart';
import 'package:unasp_ht/app/pages/login/signup/components/loading_widget.dart';
import 'package:unasp_ht/app/pages/news/news_details_page.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final HomeBloc bloc = HomeModule.to.getBloc<HomeBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notícias'.toUpperCase()),
        ),
        body: StreamBuilder<List<News>>(
            stream: bloc.newsController,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return LoadingWidget();
              }

              return SingleChildScrollView(
                child: Column(
                    children: snapshot.data
                        .map<Widget>((i) => Padding(
                              padding: EdgeInsets.all(15),
                              child: GestureDetector(
                                onTap: () => Navigator.of(context)
                                    .push<CupertinoPageRoute>(
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                NewsDetailsPage(
                                                  model: i,
                                                ))),
                                child: Container(
                                    height: 100,
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius:
                                                5.0, // has the effect of softening the shadow
                                          )
                                        ]),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 2,
                                          child: Hero(
                                            tag: i?.title,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                bottomLeft: Radius.circular(8),
                                              ),
                                              child: Image.network(
                                                i?.image ?? '',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Text(
                                                  i?.title?.toUpperCase() ?? '',
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                                Text(
                                                  i?.text ?? '',
                                                  softWrap: true,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black45),
                                                ),
                                                // )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            ))
                        .toList()),
              );
            }));
  }
}
