import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  String username;
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString("username");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
            ),
            height: 50,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "././assets/img/search.png",
                      height: 26,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Spacer(),
                    Image.asset(
                      "././assets/img/withlist.png",
                      height: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text("Search"),
          ),
        ],
      ),
    );
  }
}
