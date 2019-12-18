import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> categories = [
    "Android", "Java", "História", "Ciência", "python",
    "TCC", "Flutter", "Mobile"
  ];

  int _selectedindex;

  @override
  void initState() {
    _selectedindex = -1;
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 40.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Browse",
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    width: 24.0,
                  ),
                  Text(
                    "Recommended",
                    style: TextStyle(
                      color: Colors.grey[600]
                    ),
                  )
                ],
              ),
            ),
            Divider(color: Colors.transparent,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 70.0,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, index) => SizedBox(width: 8.0),
                itemBuilder: (context, index) {
                  if(index == 0) return GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Chip(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          backgroundColor: index == _selectedindex ? Colors.indigoAccent : Colors.grey[300],
                          label: Text(
                            categories.elementAt(index), 
                            style: TextStyle(color: index == _selectedindex ? Colors.white : Colors.grey[600] ),
                          ),
                        ),
                    ),
                    onTap: () {
                      setState(() {
                        _selectedindex = index;
                      });
                    }
                  );
                  return GestureDetector(
                    child: Chip(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        backgroundColor: index == _selectedindex ? Colors.indigo : Colors.grey[300],
                        label: Text(
                          categories.elementAt(index), 
                          style: TextStyle(color: index == _selectedindex ? Colors.white : Colors.grey[600] ),
                        ),
                      ),
                    onTap: () {
                      setState(() {
                        _selectedindex = index;
                      });
                    }
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}