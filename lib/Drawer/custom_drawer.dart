import 'package:flutter/material.dart';
import 'package:projeto_final/Drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;
  CustomDrawer(this.pageController);


  @override
  Widget build(BuildContext context) {
    return Drawer(  
      child: Stack(children: <Widget>[
        ListView(
          padding: EdgeInsets.only(left: 32, top: 16),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 8.0),
              padding: EdgeInsets.fromLTRB(0, 16, 16, 6),
              height: 170.0,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 8.0,
                    left: 0.0,
                    child: Text('Calculadora \n   Eletricistas',
                    style: TextStyle(fontSize: 38.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
           DrawerTile(Icons.arrow_forward_ios, "Resistência",  pageController, 0),
           DrawerTile(Icons.arrow_forward_ios, "Corrente",  pageController, 1),
           DrawerTile(Icons.arrow_forward_ios, "Tensão",  pageController, 2)
          ],
        )
      ],
    ));
  }
}

