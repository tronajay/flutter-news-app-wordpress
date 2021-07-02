import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html/dom.dart' as dom;

class PostDetail extends StatefulWidget{
  var featureimage;
  var title;
  var description;
  var link;
  var author;
  PostDetail({this.featureimage,this.title,this.description,this.link,this.author});

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.orange,
          actions:<Widget> [
            Padding(padding: const EdgeInsets.all(8),
            child: GestureDetector(
        onTap: () {
          launch(widget.link);
        },
        child: Icon(
          Icons.open_in_new,
          size: 26.0,
        ),
      )
            )
          ],
        ),
      floatingActionButton: FloatingActionButton(  
        child: Icon(Icons.comment),  
        backgroundColor: Colors.orange,  
        foregroundColor: Colors.white,  
        onPressed: () => {
          launch(widget.link)
        },  
      ),  
      body: SingleChildScrollView(
              child: Container(
          child: Column(
            children: [
              Hero(
                tag: Key(widget.title),
              child: Image.network(widget.featureimage,
              width: double.infinity,
              fit: BoxFit.cover,),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  
                ),
              ),
              Text(
                "By " + widget.author, 
                textAlign: TextAlign.start,
                ),
              Padding(padding: EdgeInsets.all(8),
              child: Html(
                data: widget.description,
                onLinkTap: (String? url, RenderContext context, Map<String, String> attributes, dom.Element? element) async{
                  if (await canLaunch("$url")) {
                    await launch(
                      "$url",
                    );
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),),
            ],          
          )
        ),
      ),
    );
  }

openLink(url){
 launch(url);
}

}