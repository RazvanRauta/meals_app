import 'package:flutter/material.dart';
import '../screens/tabs_screen.dart';

import '../components/drawer_content.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filtersScreen';

  final Function setFilters;
  final Map<String, bool> currentFilters;
  const FiltersScreen({
    Key key,
    @required this.setFilters,
    @required this.currentFilters,
  }) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];

    super.initState();
  }

  Widget _buildSwitch(
      String title, String subtitle, bool value, Function handleSwitch) {
    return SwitchListTile(
      title: Text(
        title,
      ),
      subtitle: Text(
        subtitle,
      ),
      value: value,
      onChanged: handleSwitch,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian
                  };
                  widget.setFilters(selectedFilters);
                  Navigator.of(context)
                      .pushReplacementNamed(TabsScreen.routeName);
                })
          ],
          title: Text(
            'Your Filters',
          ),
        ),
        drawer: DrawerContent(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitch(
                  'Gluten-free',
                  'Only include gluten-free meals',
                  _glutenFree,
                  (newValue) => setState(() => _glutenFree = newValue),
                ),
                _buildSwitch(
                  'Lactose-free',
                  'Only include vegan meals',
                  _lactoseFree,
                  (newValue) => setState(() => _lactoseFree = newValue),
                ),
                _buildSwitch(
                  'Vegetarian',
                  'Only include vegetarian meals',
                  _vegetarian,
                  (newValue) => setState(() => _vegetarian = newValue),
                ),
                _buildSwitch(
                  'Vegan',
                  'Only include vegan meals',
                  _vegan,
                  (newValue) => setState(() => _vegan = newValue),
                ),
              ],
            ))
          ],
        ));
  }
}
