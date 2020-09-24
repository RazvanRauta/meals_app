import 'package:flutter/material.dart';

import '../screens/categories_screen.dart';
import '../screens/category_screen.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
  CategoryScreen.routeName: (ctx) => CategoryScreen()
};