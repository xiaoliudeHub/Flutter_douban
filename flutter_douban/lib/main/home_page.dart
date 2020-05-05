import 'package:flutter/material.dart';
import 'package:flutter_douban/hot_page.dart';
import 'package:flutter_douban/mine_page.dart';
import 'package:flutter_douban/movies_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  int _selectIndex = 0;
final _widgetItems = [HotPage(), MoviesPage(), MinePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetItems[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('热映'),),
          BottomNavigationBarItem(icon: Icon(Icons.panorama_fish_eye), title: Text('找片'),),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('我的'),)
        ],
       currentIndex: _selectIndex,
       fixedColor: Colors.black,
       type: BottomNavigationBarType.fixed,
       onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
     setState(() {
       _selectIndex = index;
     });
  }
}