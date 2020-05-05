import 'package:flutter/material.dart';
import 'package:flutter_douban/hotpage/hot_page_list.dart';

class HotPage extends StatefulWidget {
  @override
  _HotPageState createState() => _HotPageState();
}

class _HotPageState extends State<HotPage> {
  String curCity = '深圳'; //用变量来存储当前的城市

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              GestureDetector(
                child: Text(
                  curCity,
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  _jumpToCitysWidget();
                },
              ),
              Icon(Icons.arrow_drop_down),
              Expanded(
                flex: 1,
                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                      hintText: '\uE8b6 电影 / 电视剧 / 影人',
                      hintStyle:
                          TextStyle(fontFamily: 'MaterialIcons', fontSize: 16),
                      contentPadding: EdgeInsets.only(top: 8, bottom: 8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      filled: true,
                      fillColor: Colors.black12),
                ),
              ),
            ],
          ),
          bottomWidget(curCity),
        ],
      ),
    ));
  }

  void _jumpToCitysWidget() async {
    var selectCity =
        await Navigator.pushNamed(context, '/Citys', arguments: curCity);
    if (selectCity == null) return;
    setState(() {
      curCity = selectCity;
    });
  }
}

Widget bottomWidget(String curCity) {
  return Expanded(
      flex: 1,
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(height: 50),
              child: TabBar(
                  unselectedLabelColor: Colors.black12,
                  labelColor: Colors.black87,
                  indicatorColor: Colors.black87,
                  tabs: [Tab(text: '正在热映'), Tab(text: '即将上映')]),
            ),
            Expanded(
              child: Container(
                  child: TabBarView(
                children: <Widget>[
                  HotMoviesListWidget(curCity),
                  Center(
                    child: Text('即将上映'),
                  )
                ],
              )),
            )
          ],
        ),
      ));
}
