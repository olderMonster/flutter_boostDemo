import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key, this.title}) : super(key: key);

  String title;

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            InkWell(
              onTap: (){
                FlutterBoost.singleton.open('detail',urlParams: {'title':'我是push参数'});
              },
              child: Text('点击push到IOS页面'),
            ),
            InkWell(
              onTap: (){
                FlutterBoost.singleton.open('login',urlParams: {'title':'我是present参数','present':true});
              },
              child: Text('点击present到IOS页面'),
            )
          ],
        ),
      ),
    );
  }
}

