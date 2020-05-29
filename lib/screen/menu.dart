import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[Offstage()],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Image.asset("./assets/img/house.png"),
                  height: 30,
                ),
                Container(
                  child: Image.asset("./assets/img/search.png"),
                  height: 30,
                ),
                Container(
                  child: Image.asset("./assets/img/home.png"),
                  height: 30,
                ),
                Container(
                  child: Image.asset("./assets/img/love.png"),
                  height: 30,
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("./assets/img/profil.png"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
