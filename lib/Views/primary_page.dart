import 'package:flutter/material.dart';
import 'package:projeto_final/Drawer/custom_drawer.dart';
import 'package:projeto_final/Views/page_one.dart';
import 'package:projeto_final/Views/page_three.dart';
import 'package:projeto_final/Views/page_two.dart';

final _pageController = PageController();

class PrimaryPage extends StatefulWidget {
  @override
  _PrimaryPageState createState() => _PrimaryPageState();
}

class _PrimaryPageState extends State<PrimaryPage> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            
            title: Text('CALCULAR RESISTÊNCIA'),
            backgroundColor: Colors.red,
            centerTitle: true,
          ),
          body: PageOne(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('CALCULAR CORRENTE'),
            backgroundColor: Colors.red,
            centerTitle: true,
          ),
          body: PageTwo(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('CALCULAR TENSÃO'),
            backgroundColor: Colors.red,
            centerTitle: true,
          ),
          body: PageThree(),
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}
