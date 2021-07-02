import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PopupMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return PopupMenuButton(
              icon: Icon(Icons.more_horiz),
              onSelected: (itemselect){
                if(itemselect == 0){
                  launch("https://earningtricks.in/privacy-policy");
                }else if(itemselect == 1){
                  launch("https://earningtricks.in/about-us");
                }else if(itemselect == 2){
                  launch("https://earningtricks.in/contact-us");
                }else if(itemselect == 3){
                  launch("https://earningtricks.in/advertise");
                }
              },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("Privacy Policy"),
                    value: 0,
                  ),
                  PopupMenuItem(
                    child: Text("About Us"),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text("Contact Us"),
                    value: 2,
                  ),
                  PopupMenuItem(
                    child: Text("Advertise"),
                    value: 3,
                  )
                ]
            );
  }
}