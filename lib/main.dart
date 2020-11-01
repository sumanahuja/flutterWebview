import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


void main() => runApp(MaterialApp(

debugShowCheckedModeBanner: false,
  theme:ThemeData(primarySwatch: Colors.blue),
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
FlutterWebviewPlugin plugin=FlutterWebviewPlugin();
  TextEditingController myController=TextEditingController();
  var urlString="https://www.google.com";
  launchUrl(){
    setState(() {
      if(myController.text.length!=0) {
        urlString = myController.text;
        plugin.reloadUrl(urlString);
        print(urlString);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: false,
          controller: myController,
          cursorColor: Colors.white,
          cursorWidth: 0.3,
          style: TextStyle(
            color: Colors.white
          ),
          textInputAction: TextInputAction.go,
          onSubmitted: (url) => launchUrl(),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter URL here:"
          ),

        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: ()=>launchUrl(),
          ),
        ],

      ),
      url: "https://www.flutter.dev",
      withZoom: false,
    );
  }
}


