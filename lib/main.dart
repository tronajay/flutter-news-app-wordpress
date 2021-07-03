import 'package:flutter/material.dart';
import 'appbar_actions.dart';
import 'drawer.dart';
import 'posts.dart';
import 'categories/freecourses.dart';
import 'categories/cashback.dart';
import 'categories/amazonquiz.dart';
import 'search.dart';
import 'package:connectivity/connectivity.dart';

void main() {
  runApp(MaterialApp(
    title: "Earning Tricks",
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearching = false;
  List<Widget> tabs = [];

  @override
  void initState() {
    super.initState();
    tabs.add(tab("Latest"));
    tabs.add(tab("Free Courses"));
    tabs.add(tab("Cashback Offers"));
    tabs.add(tab("Amazon Quiz"));
  }

  Widget tab(String tabName) {
    return Tab(
      text: tabName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: !isSearching
              ? Text(
                  "Earning Tricks",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              : TextField(
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchDetail(
                                  search: value,
                                )));
                  },
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: "Search Here...",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
          backgroundColor: Colors.orange,
          bottom: TabBar(
            tabs: tabs,
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white,
          ),
          actions: [
            isSearching
                ? IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        this.isSearching = false;
                      });
                    },
                  )
                : IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        this.isSearching = true;
                      });
                    },
                  ),
            PopupMenu(),
          ],
        ),
        drawer: MyDrawer(),
        body: StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (BuildContext context,
              AsyncSnapshot<ConnectivityResult> snapshot) {
            if (snapshot.hasData && snapshot.data != ConnectivityResult.none) {
              return TabBarView(
                children: [
                  Posts(),
                  Freecourses(),
                  Cashbackoffers(),
                  Amazonquiz(),
                ],
              );
            } else {
              return AlertDialog(
                title: const Text('No Internet!'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: const <Widget>[
                      Text('Please Connect to the Internet First.'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Exit'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
