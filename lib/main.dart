import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'pages/home/NewsListPage.dart';
import 'pages/home/TweetsListPage.dart';
import 'pages/home/DiscoveryPage.dart';
import 'pages/home/MyInfoPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  int _tabSelectIndex = 0;
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));

  final tabTextStyleSelected = new TextStyle(color: const Color(0xff63ca6c));
  var _tabTexts = ['资讯', '动弹', '发现', '我的'];
  var _tabImages;
  var _tabPages;

  Image getTabImage(path) {
    return Image.asset(path, width: 20.0, height: 20.0);
  }

  void initTabPages(){
    _tabPages = new IndexedStack(
      children: <Widget>[
        new NewsListPage(),
        new TweetsListPage(),
        new DiscoveryPage(),
        new MyInfoPage()
      ],
// ignore: implicit_this_reference_in_initializer
      index: _tabSelectIndex,
    );
  }

  void initTabImages() {
    if (_tabImages == null) {
      _tabImages = [
        [
          getTabImage('images/ic_nav_news_normal.png'),
          getTabImage('images/ic_nav_news_actived.png')
        ],
        [
          getTabImage('images/ic_nav_tweet_normal.png'),
          getTabImage('images/ic_nav_tweet_actived.png')
        ],
        [
          getTabImage('images/ic_nav_discover_normal.png'),
          getTabImage('images/ic_nav_discover_actived.png')
        ],
        [
          getTabImage('images/ic_nav_my_normal.png'),
          getTabImage('images/ic_nav_my_pressed.png')
        ]
      ];
    }
  }

  Image getTabIcon(int curIndex) {
    return curIndex == _tabSelectIndex
        ? _tabImages[curIndex][1]
        : _tabImages[curIndex][0];
  }

  Text getTabText(int curIndex) {
    return new Text(_tabTexts[curIndex],
        style: curIndex == _tabSelectIndex
            ? tabTextStyleSelected
            : tabTextStyleNormal);
  }

  @override
  void initState() {
    initTabImages();
    initTabPages();
    super.initState();
  }

//
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF63CA6C),
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(_tabTexts[_tabSelectIndex],
              style: TextStyle(color: Colors.white)),
          iconTheme: new IconThemeData(color: Colors.white),
        ),
        body: _tabPages,
        bottomNavigationBar: new CupertinoTabBar(
          items: [
            new BottomNavigationBarItem(
                icon: getTabIcon(0), title: getTabText(0)),
            new BottomNavigationBarItem(
                icon: getTabIcon(1), title: getTabText(1)),
            new BottomNavigationBarItem(
                icon: getTabIcon(2), title: getTabText(2)),
            new BottomNavigationBarItem(
                icon: getTabIcon(3), title: getTabText(3)),
          ],
          currentIndex: _tabSelectIndex,
          onTap: (index) {
            setState(() {
              _tabSelectIndex = index;
            });
          },
        ),
      ),
    );
  }
}
