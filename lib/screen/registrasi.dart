import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instagram_clone/custom/billaBongText.dart';
import 'package:instagram_clone/custom/cutsomButton.dart';
import 'package:http/http.dart' as http;
import 'package:instagram_clone/network/network.dart';

class Registrasi extends StatefulWidget {
  @override
  _RegistrasiState createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  var obseCure = true;
  final _key = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  cek() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
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
                Text("Please wait..."),
              ],
            ),
          );
        });
    final response = await http.post(NetworkURL.registrasi(), body: {
      "email": emailController.text.trim(),
      "username": usernameController.text.trim(),
      "password": passwordController.text.trim(),
      "name": nameController.text.trim(),
    });
    final data = jsonDecode(response.body);
    print(data);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Form(
                key: _key,
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
                      validator: (e) {
                        if (e.isEmpty)
                          return "Please input email address";
                        else
                          return null;
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
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
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Full Name",
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
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: "Username",
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
                      obscureText: obseCure,
                      decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                          ),
                          suffixIcon: IconButton(
                              icon: Icon(obseCure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  obseCure = !obseCure;
                                });
                              })),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: () {
                        cek();
                      },
                      child: CustomButton(
                        "Sign UP",
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1,
                    color: Colors.purple,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "By signing ap, you agree to our",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Term & Policy",
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
