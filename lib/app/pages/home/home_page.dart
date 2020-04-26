import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/home/home_bloc.dart';
import 'package:unasp_ht/app/pages/home/home_module.dart';
import 'package:unasp_ht/app/pages/home/pages/home/home.dart';
import 'package:unasp_ht/app/pages/home/pages/profile/profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> t = [
      Container(
        padding: EdgeInsets.all(10),
        child: Icon(
          FontAwesomeIcons.home,
          size: 20,
          color: Colors.white,
        ),
      ),
      Container(
        padding: EdgeInsets.all(10),
        child: Icon(
          FontAwesomeIcons.userAlt,
          size: 20,
          color: Colors.white,
        ),
      ),
    ];
    Color orange = Theme.of(context).secondaryHeaderColor;
    Color blue = Theme.of(context).primaryColor;
    HomeBloc bloc = HomeModule.to.getBloc<HomeBloc>();
    PageController pageController = PageController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.powerOff),
            onPressed: () => bloc.signOut(context)),
        actions: <Widget>[
          SizedBox(
            width: 15,
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              FontAwesomeIcons.exclamationTriangle,
              color: Colors.redAccent,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              FontAwesomeIcons.solidBell,
              color: Color(0xFFF3BB36),
            ),
          ),
        ],
        centerTitle: true,
        title: Image.asset(
          'assets/img/isolado_branco.png',
          width: 80,
        ),
        backgroundColor: blue,
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[Home(), Profile()],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white12,
        buttonBackgroundColor: orange,
        color: blue,
        items: t,
        onTap: (index) {
          setState(() {
            t[index] = Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            );
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          });
        },
      ),
    );
  }
}
