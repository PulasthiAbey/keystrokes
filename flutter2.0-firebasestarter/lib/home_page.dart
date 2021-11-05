import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutterfbauth/services/authservice.dart';
import 'package:flutterfbauth/alert_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _profil_name = "Nisal C"; // Replace with backend call
    var _user_name = ''; // update this with the updated one from the backend
    return Scaffold(
      appBar: AppBar(
        title: Text('Biometrics'),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text('Nisal C'),
            ),
            ListTile(
              title: const Text('Sign Out'),
              onTap: () {
                AuthService().signOut();
              },
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                MyAlert();
              },
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          Text(
            'ID 01',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
              '$_user_name'), // add the names from the backend to teh second text widget
          Text(
            'ID 02',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('User: $_user_name'),
          MyDynamicListView(),
        ],
      ),
    );
  }
}

class MyDynamicListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _item_count =
        5; // update all these three values with the back end values you get
    var char_items = [];
    var char_items_times = [];
    // TODO: implement build
    return ListView.builder(
        itemCount: _item_count,
        itemBuilder: (context, index) {
          return GridView.count(crossAxisCount: 2, children: <Widget>[
            new Text(char_items[index]),
            new Text(char_items_times[index])
          ]);
        });
  }
}
