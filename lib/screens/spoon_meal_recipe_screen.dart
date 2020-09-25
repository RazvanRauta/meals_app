import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:meals_app/models/spoon_recipe.dart';

class SpoonRecipeScreen extends StatefulWidget {
  //This stateful widget page takes in String mealType and Recipe recipe
  final SpoonRecipe recipe;

  SpoonRecipeScreen({this.recipe});

  @override
  _SpoonRecipeScreenState createState() => _SpoonRecipeScreenState();
}

class _SpoonRecipeScreenState extends State<SpoonRecipeScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar is widget.mealType
      appBar: AppBar(
        title: Text(widget.recipe.title),
      ),
      /**
       * Body is a Webview. Ensure you have imported webview flutter.
       * 
       * initialUrl- spoonacularSourceUrl of our parsed in recipe
       * javascriptMode - set to unrestricted so as JS can load in the webview
       */
      body: WebView(
        initialUrl: widget.recipe.spoonacularSourceUrl,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        //JS unrestricted, so that JS can execute in the webview
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
