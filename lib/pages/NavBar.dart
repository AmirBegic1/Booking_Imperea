import 'dart:io';

import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Amir Begić'), //povuc getx
            accountEmail: Text(
                'amir.begic12@gmail.com'), //povuc getx kad se loginiju / registruje
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  /*
                child: Image.network(
                  dodat sliku tj natjerat korisnika da doda sliku 
                  https://stackoverflow.com/questions/73047063/i-want-to-display-all-photos-from-gallery-in-flutter
                ),
                */
                  ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Lista hotela'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Podijeli'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Postavke'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Uslovi korištenja'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('Odjavi se'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => null,
          ),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => exit(0),
          ),
        ],
      ),
    );
  }
}
