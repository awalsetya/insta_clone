import 'package:flutter/material.dart';
import 'package:instagram_clone/screen/menu/history.dart';
import 'package:instagram_clone/screen/menu/home.dart';
import 'package:instagram_clone/screen/menu/profile.dart';
import 'package:instagram_clone/screen/menu/searching.dart';
import 'package:instagram_clone/screen/menu/uploading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectIndex = 0;
  String username, email;
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString("username");
      email = pref.getString("email");
    });
    print("email adrress: $email, Username : $username");
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Offstage(
              offstage: selectIndex != 0,
              child: Home(),
            ),
            Offstage(
              offstage: selectIndex != 1,
              child: Searching(),
            ),
            Offstage(
              offstage: selectIndex != 2,
              child: Uploading(),
            ),
            Offstage(
              offstage: selectIndex != 3,
              child: History(),
            ),
            Offstage(
              offstage: selectIndex != 4,
              child: Profil(),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      selectIndex = 0;
                    });
                  },
                  child: Container(
                    child: Image.asset("./assets/img/house.png"),
                    height: 30,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectIndex = 1;
                    });
                  },
                  child: Container(
                    child: Image.asset("./assets/img/search.png"),
                    height: 30,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectIndex = 2;
                    });
                  },
                  child: Container(
                    child: Image.asset("./assets/img/home.png"),
                    height: 30,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectIndex = 3;
                    });
                  },
                  child: Container(
                    child: Image.asset("./assets/img/love.png"),
                    height: 30,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectIndex = 4;
                    });
                  },
                  child: Container(
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
