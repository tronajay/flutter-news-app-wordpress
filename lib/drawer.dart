import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset("assets/et_header.jpg"),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.telegram),
              title: Text("Telegram"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                launch("https://t.me/earningtricksin");
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.instagram),
              title: Text("Instagram"),
              trailing: Icon(Icons.open_in_new),
              onTap: (){
                launch("https://instagram.com/earningtricksoffl");
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.facebook),
              title: Text("Facebook"),
              trailing: Icon(Icons.open_in_new),
              onTap: (){
                launch("https://instagram.com/earningtricksoffl");
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.share),
              title: Text("Share App"),
              trailing: Icon(Icons.open_in_new),
              onTap: (){
                Share.share("Wanna Earn Some Money/Paytm Cash in Free Time? \n We Will Provide You Latest Earning Apps and Cashback offers. Download the App Now \n https://earningtricks.in/app");
              },
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text("Website"),
              trailing: Icon(Icons.open_in_browser),
              onTap: (){
                launch("https://earningtricks.in");
              },
            ),
          ],
        ),
      );
  }
}