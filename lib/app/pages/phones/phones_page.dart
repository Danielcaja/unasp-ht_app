import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:unasp_ht/app/pages/phones/phone_model.dart';
import 'package:unasp_ht/app/pages/calendar/ensino/ensino_model.dart';
import 'package:unasp_ht/app/shared/components/loading_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class PhonesPage extends StatefulWidget {
  @override
  _PhonesPageState createState() => _PhonesPageState();
}

class _PhonesPageState extends State<PhonesPage> {
  final BehaviorSubject<List<Ensino>> phonesController =
      BehaviorSubject<List<Ensino>>();
  @override
  Widget build(BuildContext context) {
    getPhones().then((phones) => phonesController.add(phones));

    return Scaffold(
      appBar: AppBar(
        title: Text('Ramais'),
      ),
      body: StreamBuilder<List<Ensino>>(
          stream: phonesController,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: LoadingWidget());
            }

            return Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: snapshot.data
                    .map((i) => GestureDetector(
                          onTap: () async => await launch('tel:2118${i?.name}'),
                          child: ListTile(
                              title: Text(i?.name ?? ''),
                              trailing: Text(
                                i?.name ?? '',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
                              )),
                        ))
                    .toList(),
              ),
            );
          }),
    );
  }

  Future<List<Ensino>> getPhones() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('ensino').get();

      if (snapshot == null || snapshot.docs == null) {
        return null;
      }
      return snapshot.docs.map((f) => Ensino.fromJson(f.data())).toList();
    } catch (e) {
      return null;
    }
  }

  @override
  void dispose() {
    phonesController.close();
    super.dispose();
  }
}
