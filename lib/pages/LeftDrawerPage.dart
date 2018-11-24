import 'package:flutter/material.dart';

import 'package:flutter_osc_dev/utils/ScreenUtils.dart';

class LeftDrawerPage extends StatelessWidget {
//  var newsListPageState = new NewsListPageState();
  LeftDrawerPage() {
    print("LeftDrawerPage");
  }

  @override
  Widget build(BuildContext context) {
    print("LeftDrawerPageState build");
    return new ConstrainedBox(
      constraints: BoxConstraints.expand(
          width: ScreenUtils.getScreenWidth(context) * 0.8),
      child: new Material(
        child: new Center(child: new Text("LeftDrawerPageState")),
      ),
    );
  }
}
