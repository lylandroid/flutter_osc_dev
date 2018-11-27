import 'package:flutter/material.dart';
import 'package:flutter_osc_dev/base/ResponseBean.dart';

import 'package:flutter_osc_dev/utils/HttpUtils.dart';
import 'package:flutter_osc_dev/listener/ResponseCallback.dart';
import 'package:flutter_osc_dev/bean/NewsListBean.dart';
import 'package:flutter_osc_dev/api/Api.dart';

class NewsListPage extends StatefulWidget {
//  var newsListPageState = new NewsListPageState();
  NewsListPage() {
    print("NewsListPage");
  }

  @override
  State<StatefulWidget> createState() {
    print("NewsListPage createState");
    return new NewsListPageState();
  }
}

class NewsListPageState extends State<NewsListPage> {
  var _listData = new List<String>();
  final _listRowFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    print("NewsListPageState initState");
//    for (int i = 0; i < 10; i++) {
//      _listData.add("item " + (i + 1).toString());
//    }
    String url = Api.NEWS_LIST;
    Map<String, String> pramsMap = {};
    pramsMap["pageIndex"] = "1";
    pramsMap["pageSize"] = "10";
    HttpUtils.getInstance().get(url, pramsMap,new NewsListBean()
        ,(statusCode, isSuccess, errMsg,  IBean iBean ){
          NewsListBean beanImp = iBean;
//            print("NewsListBean: ${beanImp.msg}");

    });
  }

  @override
  Widget build(BuildContext context) {
    print("NewsListPageState build");
    return MaterialApp(
      home: new Scaffold(
        body: _buildListView(context),
      ),
    );
  }

  Widget _buildListView(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider(height: 1.0);
        int index = i ~/ 2;
        return _buildRow(context, _listData[index]);
      },
      itemCount: _listData.length * 2,
    );
  }

  Widget _buildRow(BuildContext context, String data) {
    return new ListTile(
      title: Text(data, style: _listRowFont),
    );
  }
}
