import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/login/signup/components/loading_widget.dart';
import 'package:unasp_ht/app/pages/menu/menu_bloc.dart';
import 'package:unasp_ht/app/pages/menu/menu_item_model.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final MenuBloc menuBloc = MenuBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cardápio'),
      ),
      body: StreamBuilder<List<MenuItem>>(
          stream: menuBloc.menuController,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: LoadingWidget());
            }

            return Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: snapshot.data
                    .map(
                      (i) => ListTile(
                        title: Text(i?.name ?? ''),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              child: Icon(i.wasLiked ?? false
                                  ? FontAwesomeIcons.solidThumbsUp
                                  : FontAwesomeIcons.thumbsUp),
                              onTap: () => menuBloc.like(i),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              child: Icon(i.wasDisliked ?? false
                                  ? FontAwesomeIcons.solidThumbsDown
                                  : FontAwesomeIcons.thumbsDown),
                              onTap: () => menuBloc.dislike(i),
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          }),
    );
  }
}
