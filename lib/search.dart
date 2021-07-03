import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'postdetails.dart';

class SearchDetail extends StatefulWidget{
  var search;
  SearchDetail({this.search});

  @override
  _SearchDetailState createState() => _SearchDetailState(search: search);
}

class _SearchDetailState extends State<SearchDetail> {

var search;
_SearchDetailState({this.search});

  var searchurl = "https://earningtricks.in/index.php/wp-json/wp/v2/posts?per_page=10&status=publish&search=";
  var data;

  void postData() async {
    var searchdata = searchurl+search;
    var res = await http.get(Uri.parse(searchdata));
    data = jsonDecode(res.body);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    postData();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: Text(search),
          backgroundColor: Colors.orange,
        ),  
      body: Container(
      child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: data != null
              ? ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PostDetail(
                                      featureimage: data[index]["uagb_featured_image_src"]["jnews-360x180"][0],
                                      title: data[index]["title"]['rendered'].replaceAll("#8211;", ""),
                                      description: data[index]["content"]["rendered"],
                                      link: data[index]["link"],
                                      author: data[index]["uagb_author_info"]["display_name"],
                                    )));
                      },
                      child: Column(
                        children: [
                          Hero(
                            tag: Key(data[index]["title"]['rendered'].replaceAll("#8211;", "")),
                            child: Image.network(data[index]["uagb_featured_image_src"]["jnews-360x180"][0]),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              data[index]["title"]['rendered'].replaceAll("#8211;", ""),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
              : Center(
                  child: CircularProgressIndicator(),
                )),
    ),
    );
  }

}