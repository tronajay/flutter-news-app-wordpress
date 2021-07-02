import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import '../postdetails.dart';

  var data;

class Amazonquiz extends StatefulWidget{
  @override
  _AmazonquizState createState() => _AmazonquizState();
}

class _AmazonquizState extends State<Amazonquiz>{
    var amazonquizurl = "https://earningtricks.in/index.php/wp-json/wp/v2/posts?per_page=10&categories=7&status=publish";

  getData() async{
    var res = await http.get(Uri.parse(amazonquizurl));
    data=jsonDecode(res.body);
    setState(() {});
}

@override
  void initState(){
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context){
    return Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: data != null?
            ListView.builder(
              itemCount: data.length,
              itemBuilder: (context,index){
                return Card(
              child: InkWell(
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>PostDetail(
                    featureimage: data[index]["uagb_featured_image_src"]["jnews-360x180"][0],
                    title: data[index]["title"]['rendered'].replaceAll("#8211;",""),
                    description: data[index]["content"]["rendered"],
                    link:data[index]["link"],
                    author: data[index]["uagb_author_info"]["display_name"],
                  )));
                },
                child: Column(children: [
                  Image.network(data[index]["uagb_featured_image_src"]["jnews-360x180"][0]),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      
                      data[index]["title"]['rendered'].replaceAll("#8211;",""),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],),
              )
            );
              },
              ):
            Center(
              child: CircularProgressIndicator(),
            )
          ),
        );
  }
}