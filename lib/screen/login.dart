import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instagram_clone/custom/billaBongText.dart';
import 'package:instagram_clone/custom/cutsomButton.dart';
import 'package:instagram_clone/model/loginModel.dart';
import 'package:instagram_clone/network/network.dart';
import 'package:instagram_clone/screen/menu.dart';
import 'package:instagram_clone/screen/registrasi.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginModel model;
  String username;
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString("username");
      username != null
          ? Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (contex) => Menu()))
          : null;
    });
  }

  var obSecure = true;

  final _key = GlobalKey<FormState>();

  cek() {
    if (_key.currentState.validate()) {
      submit();
    }
  }

  submit() async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Processing"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(
                  height: 16,
                ),
                Text("Please wait...")
              ],
            ),
          );
        });

    final response = await http.post(NetworkURL.login(), body: {
      "username": usernameController.text.trim(),
      "password": passwordController.text.trim(),
    });
    //final data = jsonDecode(response.body);
    // int value = data['value'];
    // String message = data['message'];
    model = LoginModel.api(jsonDecode(response.body));
    print(model);
    if (model.value == 1) {
      Navigator.pop(context);
      savePrev(
          model.id, model.email, model.username, model.name, model.createdDate);
      //print(data);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
    } else {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("${model.message}"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("OK"),
                ),
              ],
            );
          });
    }
  }

  savePrev(
    String id,
    String email,
    String username,
    String name,
    String createdDate,
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setString("id", id);
      pref.setString("email", email);
      pref.setString("username", username);
      pref.setString("name", username);
      pref.setString("createdDate", createdDate);
    });
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
        body: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(10),
                  children: <Widget>[
                    BillabongText(
                      "Instagram",
                      fontsize: 50,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: "Phone number,email or username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: obSecure,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(obSecure
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(
                              () {
                                obSecure = !obSecure;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => Menu(),
                        //   ),
                        // );
                        cek();
                      },
                      child: CustomButton(
                        "Login",
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an acount ?",
                      textAlign: TextAlign.center,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Registrasi(),
                          ),
                        );
                      },
                      child: Text(
                        "SignUP",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
